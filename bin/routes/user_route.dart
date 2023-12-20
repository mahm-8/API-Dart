import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import '../handlers/user/delete_user.dart';
import '../handlers/user/edit_user.dart';
import '../handlers/user/get_user.dart';
import '../helper/check_token.dart';

class UserRoute {
  Router get userRoute {
    final route = Router();
    route
      ..get("/", users)
      ..post("/edit_user", updateUser)
      ..delete("/delete_user", deleteUser);
    final pipline =
        Pipeline().addMiddleware(checkToken()).addHandler(route);
    return route;
  }
}
