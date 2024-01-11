import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/user/delete_user.dart';
import '../handlers/user/edit_user.dart';
import '../handlers/user/iamge_user.dart';
import '../handlers/user/producet.dart';
import '../helper/check_token.dart';

class UserRoute {
  Handler get userRoute {
    final route = Router();
    route
      ..get("/", users)
      ..post("/edit_user", updateUser)
      ..delete("/delete_user", deleteUser)
      ..post('/image', uploadUser);
    final pipline =
        Pipeline().addMiddleware(checkToken()).addHandler(route);
    return pipline;
  }
}
