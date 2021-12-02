class Usuario {
  int? id;
  String? email;
  String? senha;

  Usuario(this.id, this.email, this.senha);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'email': email,
      'senha': senha,
    };
    return map;
  }

  Usuario.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    email = map['email'];
    senha = map['senha'];
  }

  @override
  String toString() {
    return "Usuario => (id: $id, email: $email, senha: $senha)";
  }
}
