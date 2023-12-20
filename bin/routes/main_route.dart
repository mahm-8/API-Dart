import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'auth_route.dart';
import 'user_route.dart';
import 'users_route.dart';

class MainRoute {
  Router get routeApp {
    final route = Router();
    route
      ..mount("/auth", AuthRoute().authRoute)
      ..mount("/user", UserRoute().userRoute)
      ..mount("/public", UsersRoute().userRoute)
      ..all("/<ignore|.*>", (Request req) {
        return Response.notFound("not found");
      });
    return route;
  }
}
