import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:symphony/routing/app_routes.dart';
import 'package:symphony/routing/modules/root_module.dart';
import 'package:symphony_engine/symphony_engine.dart';
import 'package:symphony_ui/symphony_ui.dart';

Future<void> main() async => Future.wait([
  SymphonyEngine.init(),
  SymphonyUI.init(ModularApp(module: RootModule(), child: const MyApp())),
]);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Modular.setInitialRoute(AppRoutes.home);
  }

  @override
  void dispose() {
    Modular.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => App(
    routerConfig: Modular.routerConfig,
  );
}
