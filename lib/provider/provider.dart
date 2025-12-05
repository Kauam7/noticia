import 'package:noticia_tela/domain/user.dart';
import 'package:flutter/foundation.dart';

class ProfileProvider extends ChangeNotifier {
  late User _user;

  User get user => _user;

  setUser(User user) {
    _user = user;
    notifyListeners();
  }
}