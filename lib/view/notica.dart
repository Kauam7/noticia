import 'package:flutter/material.dart';
import 'package:noticia_tela/domain/noticia.dart';
import 'package:noticia_tela/datb/db_helper.dart';
import 'package:noticia_tela/datb/noticial.dart';
import 'package:noticia_tela/datb/noticial.dart';


class NoticiaPage extends StatefulWidget {
  const NoticiaPage({Key? key}) : super(key: key);

  @override
  State<NoticiaPage> createState() => _NoticiaPageState();
}


class _NoticiaPageState extends State<NoticiaPage> {
 late Future<List<Noticia>> noticias ;

  void initState() {
    super.initState();

    noticias = NoticiaDao().listarnoticia() ;
    // loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
        future: noticias,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Noticia> listaNoticia = snapshot.requireData;
            return buildNoticias(listaNoticia);
          }

          return Center(
              child: CircularProgressIndicator(
                color: Color(0xFFE41D56),
              ));
        },
      ),
    );
  }

  buildNoticias(List<Noticia> noticias) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        final noticia = noticias[index];

        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          elevation: 2,
          color: Colors.blue,
          child: Column(
            children: [
              Text(
                noticia.titulo ?? 'Sem título',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(noticia.texto!),
            ]
          ),
        );
      },
    );
  }
}
