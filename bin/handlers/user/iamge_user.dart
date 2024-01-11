import 'dart:convert';
import 'dart:typed_data';
import 'package:shelf/shelf.dart';
import '../../configs/supabase.dart';

uploadUser(Request request) async {
  try {
    final user = SupabaseNet.supabases;
    final image = await request.read().toList();
    final id = await SupabaseNet.supabases!.auth
        .getUser(request.headers["authorization"]?.split(' ')[1]);
    final oldImage = await SupabaseNet.supabases?.storage
        .from('image_app')
        .list(path: 'test_api');
    print('$oldImage dd');
    for (var element in oldImage!) {
      if (element.name.startsWith(id.user!.id)) {
        print(element.name);
        await user?.storage
            .from("image_app")
            .remove(["test_api/${element.name}"]);
      }
    }
    final name = '${id.user?.id}-${DateTime.now()}';
    await user?.storage
        .from('image_app')
        .uploadBinary('test_api/$name.png', Uint8List.fromList(image[0]));

    final url =
        user?.storage.from('image_app').getPublicUrl('test_api/$name.png');
    await user
        ?.from('user_api')
        .update({'image': url}).eq("id_auth", id.user!.id);

    return Response.ok("success upload",
        headers: {"Content-Type": "application/json"});
  } on FormatException catch (e) {
    return Response.badRequest(
        body: jsonEncode({"meg": e.message}),
        headers: {"Content-Type": "application/json"});
  } catch (e) {
    print(e);
    return Response.badRequest(
        body: jsonEncode({"meg": "token is invalid"}),
        headers: {"Content-Type": "application/json"});
  }
}
