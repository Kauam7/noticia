class Descricao {
  int? id;
  String? titulo;
  String? descricao;
  String? caracteristicas;
  String? objetivo;
  String? desenvolvedor;

  Descricao(
      {this.id,
        this.titulo,
        this.descricao,
        this.caracteristicas,
        this.objetivo,
        this.desenvolvedor});

  Descricao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    caracteristicas = json['caracteristicas'];
    objetivo = json['objetivo'];
    desenvolvedor = json['desenvolvedor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['caracteristicas'] = this.caracteristicas;
    data['objetivo'] = this.objetivo;
    data['desenvolvedor'] = this.desenvolvedor;
    return data;
  }
}