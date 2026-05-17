import 'package:flutter_modular/flutter_modular.dart';
import 'package:symphony/routing/app_routes.dart';
import 'package:symphony/ui/screens/home/home_screen.dart';
import 'package:symphony/ui/screens/home/home_view_model.dart';
import 'package:symphony_engine/symphony_engine.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) => i
    ..addSingleton<StorageService>(
      DefaultStorageService.new,
      config: BindConfig<StorageService>(onDispose: (s) => s.dispose()),
    )
    ..addSingleton<MetadataService>(
      DefaultMetadataService.new,
      config: BindConfig<MetadataService>(onDispose: (s) => s.dispose()),
    )
    ..addSingleton<DirectoryService>(
      DirectoryService.create,
      config: BindConfig<DirectoryService>(onDispose: (s) => s.dispose()),
    )
    ..addSingleton<SongRepository>(
      () => DefaultSongRepository(
        i.get<StorageService>(),
        i.get<MetadataService>(),
        i.get<DirectoryService>(),
      ),
      config: BindConfig<SongRepository>(onDispose: (r) => r.dispose()),
    )
    ..addSingleton<HomeViewModel>(
      () => HomeViewModel(i.get<SongRepository>()),
      config: BindConfig<HomeViewModel>(onDispose: (v) => v.dispose()),
    );

  @override
  void routes(RouteManager r) => r.child(
    AppRoutes.root,
    child: (_) => const HomeScreen(),
  );
}
