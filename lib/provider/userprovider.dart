import 'package:noticia_tela/domain/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  late List<User> _users;
  late User _user;

  User get user => _user;
  UserProvider(){
    _users = [];
    _user= User(id:99999999,name: "", sexo: "");
  }
  void setUser(User u) {
    _user = u;
    notifyListeners();
  }
}