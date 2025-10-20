import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  initDb() async {
    String path = await getDatabasesPath();
    String dbmane = 'noticia.dd';

    String dbPath = join(path, dbmane);
    var bd = await openDatabase(dbPath, version: 1, onCreate: onCreate);

    return bd;
  }

  Future<void> onCreate(Database db, int version) async {
    String sql = '''CREATE TABLE noticia(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    texto TEXT NOT NULL,
    data
      )
     ''';
    await db.execute(sql);

    sql = "INSERT INTO noticia (titulo, texto, data) VALUES ('Evento Escolar', 'A escola anunciou a feira de ciências para o próximo mês.', '2025-10-20')";
    db.execute(sql);

    sql = "INSERT INTO noticia (titulo, texto, data) VALUES ('Tecnologia', 'Nova pesquisa revela avanços no uso da inteligência artificial em sala de aula.', '2025-10-20')";
    db.execute(sql);

    sql = "INSERT INTO noticia (titulo, texto, data) VALUES ('Esportes', 'O time local venceu o campeonato intercolegial com uma vitória impressionante.', '2025-10-19')";
    db.execute(sql);

    sql = "INSERT INTO noticia (titulo, texto, data) VALUES ('Comunidade', 'Alunos se unem em campanha de arrecadação para famílias carentes.', '2025-10-18')";
    db.execute(sql);

    sql = "INSERT INTO noticia (titulo, texto, data) VALUES ('Educação', 'Professores participam de curso de capacitação sobre metodologias ativas.', '2025-10-17')";
    db.execute(sql);
  }
}
