import 'package:flutter_modular/flutter_modular.dart';
import 'package:symphony/routing/app_routes.dart';
import 'package:symphony/routing/modules/home_module.dart';
import 'package:symphony/ui/screens/root/root_screen.dart';

class RootModule extends Module {
  @override
  void routes(RouteManager r) => r.child(
    AppRoutes.root,
    child: (_) => const RootScreen(),
    children: [.module(AppRoutes.home, module: HomeModule())],
  );
}
