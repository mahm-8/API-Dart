import 'dart:io';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_hotreload/shelf_hotreload.dart';
import 'configs/supabase.dart';
import 'routes/main_route.dart';

void main() async {
  withHotreload(
    () => createServer(),
    onReloaded: () => print('Reload!'),
    onHotReloadNotAvailable: () => print('No hot-reload :('),
    onHotReloadAvailable: () => print('Yay! Hot-reload :)'),
    onHotReloadLog: (log) => print('Reload Log: ${log.message}'),logLevel: Level.INFO,
  );
}

Future<HttpServer> createServer() async {
  SupabaseNet().supa;
  final ip = InternetAddress.anyIPv4;
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(MainRoute().routeApp, ip, port);
  print('http://${server.address.host}:${server.port}');
  return server;
}
