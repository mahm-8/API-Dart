import 'package:shelf/shelf.dart';

import '../configs/supabase.dart';

Middleware checkToken() => (innerHandler) => (Request req) async {
      final body =
          await SupabaseNet.supabases!.auth.getUser(req.headers["token"]);
      return innerHandler(req);
    };
