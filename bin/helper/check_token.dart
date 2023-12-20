import 'package:shelf/shelf.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

Middleware checkToken() => (innerHandler) => (Request req) {
      try {
        final token = req.headers["authorization"]?.split(' ')[1];
        final jwt = JWT.verify(
            token!,
            SecretKey(
                'gD4JpUJXoNZ70yzJNxuKy2xWJHP7I+r3p/Eo9BZwQpAAmXugBLQbUxeVdyOFtMzjMcutThzp752VD0PzYtF5dg=='));
        print('Payload: ${jwt.payload}');
        return innerHandler(req);
      } on JWTExpiredException {
      
        return Response.unauthorized("unauthorized");
      } on JWTException catch (ex) {
        print(ex.message);
        return Response.unauthorized("unauthorized"); // ex: invalid signature
      } catch (e) {
        return Response.badRequest(body: "");
      }
    };
