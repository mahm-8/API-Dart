import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../handlers/public/get_user.dart';

class UsersRoute {
  Handler get userRoute {
    final route = Router();
    route.get("/", product);

    return route;
  }
}
