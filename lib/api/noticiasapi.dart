import 'package:noticia_tela/domain/noticia.dart';
import 'package:dio/dio.dart';
class NoticiaApi {
  final dio = Dio();
  String baseUrl = 'https://newsapi.org/v2/top-headlines?category=health&q=cancer&apiKey=df22b43704a845aab2659006fcd13efd';

  Future<List<Noticia>> findAll() async {
    List<Noticia> listaNoticia = [];
    var result = await dio.get('$baseUrl');

    if (result.statusCode == 200) {
      var listResult = result.data['articles'];
      for (var json in listResult) {
        Noticia noticia = Noticia.fromJson(json);
        listaNoticia.add(noticia);
      }
    }



    return listaNoticia;
  }

}