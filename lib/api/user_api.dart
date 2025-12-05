import 'package:noticia_tela/domain/user.dart';
import 'package:dio/dio.dart';
class NoticiaApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/Kauam7/api_usuario/user';

  Future<List<User>> findAll() async {
    List<User> listauser = [];
    var result = await dio.get('$baseUrl');

    if (result.statusCode == 200) {
      var listResult = result.data;
      for (var json in listResult) {
        User user = User.fromJson(json);
        listauser.add(user);
      }
    }



    return listauser;
  }

}