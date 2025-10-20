
import 'package:noticia_tela/domain/noticia.dart';

import 'package:noticia_tela/datb/db_helper.dart';


import 'package:sqflite/sqflite.dart';
 class NoticiaDao {
   Future<List<Noticia>> listarnoticia() async {
     List<Noticia> listanoticia = [];
     Database db = await DBhelper().initDb();

     String sql = 'SELECT * FROM  noticia;';
     var listResult = await db.rawQuery(sql);

     print(listResult);
     return listanoticia;
   }
 }