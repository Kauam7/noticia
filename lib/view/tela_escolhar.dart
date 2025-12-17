import 'package:flutter/cupertino.dart';
import 'package:noticia_tela/api/user_api.dart';
import 'package:noticia_tela/domain/user.dart';
import 'package:noticia_tela/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:noticia_tela/view/notica.dart';
import 'package:noticia_tela/domain/descricao.dart';
import 'package:provider/provider.dart';

import '../api/descriçao.dart';


class Tela_escolhar extends StatefulWidget {
  const Tela_escolhar ({super.key});

  @override
  State<Tela_escolhar> createState() => _Tela_escolharState();
}

class _Tela_escolharState extends State<Tela_escolhar> {
  late Future<List<User>> users ;
  bool selecao = false;



  @override
  void initState() {

    super.initState();
    users = Userapi().findAll();
    print("carregou");
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

                  Text("bem vindo "+context.watch<UserProvider>().user.name!, style: TextStyle()),
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
                future: users,
                builder: (context, snapshot) {
                  print(snapshot.error);
                  if (snapshot.hasData) {
                    List<User> listaUser = snapshot.requireData;
                    return buildDescricao(listaUser);
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

  buildDescricao(List<User> users) {
    print("entrou");
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          elevation: 2,
          color: Colors.white,
          child: Column(
              children: [
                SizedBox(height: 10),
                Text("deseja escolhe usario "+users[index].name!),
                Checkbox(isError:true,value:users[index].secelionada, onChanged:(bool? escolhar){

                if(!users[index].secelionada!) {
                  users[index].secelionada = true;

                  navagacao(0);
                  context.read<UserProvider>().setUser(users[index]);

                }else{
                  users[index].secelionada = false;
                }
              }
                )
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
            context, MaterialPageRoute(builder: (b) => Tela_escolhar()));
    }  }

}



