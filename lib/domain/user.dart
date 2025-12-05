class User {
  String? name;
  String? sexo;

  User({this.name, this.sexo});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sexo = json['sexo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['sexo'] = this.sexo;
    return data;
  }
}