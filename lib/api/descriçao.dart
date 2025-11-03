import 'package:noticia_tela/domain/descricao.dart';
import 'package:dio/dio.dart';
class DescricaoApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/Kauam7/fake-api/descricao';
  Future<List<Descricao>> findAll() async {
    List<Descricao> listadescricao = [];
    var result = await dio.get('$baseUrl');


      var listResult = result.data;
    if (result.statusCode == 200) {
      for(var json in listResult) {
        Descricao descricao = Descricao.fromJson(json);
        listadescricao.add(descricao);
      }
    }



    return listadescricao;
  }

}