import 'package:noticia_tela/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:noticia_tela/datb/db_helper.dart';
import 'package:noticia_tela/view/tela_escolhar.dart';
import 'package:provider/provider.dart';
import 'package:noticia_tela/provider/userprovider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:noticia_tela/view/notica.dart';

import 'view/sobrenois.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MaterialApp(
        home: Tela_escolhar(),
      ),
    ),
  );
}





