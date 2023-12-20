import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'configs/supabase.dart';
import 'routes/main_route.dart';

void main() async {
 await createServer();
}

Future<HttpServer> createServer() async {
  SupabaseNet().supa;
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(MainRoute().routeApp, ip, port);
  print('http://${server.address.host}:${server.port}');
  return server;
}
