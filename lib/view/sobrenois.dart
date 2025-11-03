import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noticia_tela/view/notica.dart';
import 'package:noticia_tela/domain/descricao.dart';

import '../api/descriçao.dart';


class Sobrenois extends StatefulWidget {
  const Sobrenois ({super.key});

  @override
  State<Sobrenois> createState() => _SobrenoisState();
}

class _SobrenoisState extends State<Sobrenois> {
  late Future<List<Descricao>> descricao ;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    descricao = DescricaoApi().findAll();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: buildbody());
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

                Text("kaka news", style: TextStyle()),
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
              future: descricao,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Descricao> listaDescricao = snapshot.requireData;
                  return buildDescricao(listaDescricao);
                }

                return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFE41D56),
                    ));
              },
            ),
          )
        ),
      ),
    );
  }

  buildDescricao(List<Descricao> descricaolist) {
    return ListView.builder(
      itemCount: descricaolist.length,
      itemBuilder: (context, index) {
        final descricao = descricaolist[index];

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

                ),
                Text(
                  descricao.titulo!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                Text(descricao.desenvolvedor!),

                Text(descricao.caracteristicas!),

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
  }  }

}



