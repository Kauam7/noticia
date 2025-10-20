class Noticia{
  int? id;
  String? titulo;
  String? texto;
  String? data;

  Noticia({this.id, this.titulo, this.texto, this.data});

  Noticia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    texto = json['texto'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['texto'] = this.texto;
    data['data'] = this.data;
    return data;
  }
}