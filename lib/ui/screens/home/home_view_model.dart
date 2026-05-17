import 'package:flutter/widgets.dart';
import 'package:symphony_engine/symphony_engine.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(this._songRepo);

  final SongRepository _songRepo;
}
