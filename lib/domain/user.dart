class User {
  int? id;
  String? name;
  String? sexo;
  bool? secelionada;

  User({this.id, this.name, this.sexo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sexo = json['sexo'];
    secelionada = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sexo'] = this.sexo;
    return data;
  }
}