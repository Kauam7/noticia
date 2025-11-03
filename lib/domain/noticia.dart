class Noticia {
  String? titulo;
  String? autor;
  String? data;
  String? urlImagem;


  Noticia.fromJson(Map<String, dynamic> json) {
    titulo = json['title'];
    autor = json['author'] ;
    data = json['publishedAt'] ;
    urlImagem = json['urlToImage'];
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'autor': autor,
      'data': data,
      'urlImagem': urlImagem,
    };
  }
  Noticia(this.titulo, this.autor, this.data, this.urlImagem);
}
