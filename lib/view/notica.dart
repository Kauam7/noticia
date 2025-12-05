import 'package:flutter/material.dart';
import 'package:noticia_tela/domain/noticia.dart';
import 'package:noticia_tela/datb/db_helper.dart';
import 'package:noticia_tela/datb/noticialDao.dart';
import 'package:noticia_tela/datb/noticialDao.dart';
import 'package:noticia_tela/api/noticiasapi.dart';
import 'package:noticia_tela/view/sobrenois.dart';
import 'package:provider/provider.dart';

import '../provider/userprovider.dart';


class NoticiaPage extends StatefulWidget {
  const NoticiaPage({Key? key}) : super(key: key);

  @override
  State<NoticiaPage> createState() => _NoticiaPageState();
}


class _NoticiaPageState extends State<NoticiaPage> {
 late Future<List<Noticia>> noticias ;

  void initState() {
    super.initState();

    noticias = NoticiaApi().findAll() ;
    // loadData();
  }
  @override
  Widget build(BuildContext context) {
    return buildbody();
  }



buildbody() {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [

              Text("bem vindo"+context.watch<UserProvider>().user.name!, style: TextStyle()),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "mais",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0 ,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          onTap: navagacao,
          items: [

            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper_outlined),
              label: "notica",
            ),
            BottomNavigationBarItem(icon:
            Icon(Icons.abc_outlined),
                label: "sobre nois"
            ),


          ],
        ),
        body: Padding(
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
                    color: Color(0xFF44FFF9),
                  ));
            },
          ),
        ),
      ),
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
         color: Colors.white,
         child: Column(
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.all(
                   Radius.circular(16),
                 ),
                 child: Image.network(noticia.urlImagem!),
               ),
               Text(
                 noticia.titulo ?? 'Sem título',
                 style: TextStyle(fontWeight: FontWeight.bold),
               ),

               Text(noticia.autor ?? 'sem autor'),
             ]
         ),
       );
     },
   );
 }
 navagacao(i){
   switch(i) {
     case 0:
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (b) => NoticiaPage()));
     case 1:
       Navigator.pushReplacement(
           context, MaterialPageRoute(builder: (b) => Sobrenois()));
   }
 }
}

