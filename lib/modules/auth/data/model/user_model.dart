import 'dart:convert';

class UserModel {
  String nome;
  String usuario;
  String senha;

  UserModel({
    required this.nome,
    required this.usuario,
    required this.senha,
  });

  UserModel copyWith({
    String? nome,
    String? usuario,
    String? senha,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      usuario: usuario ?? this.usuario,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'usuario': usuario,
      'senha': senha,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      nome: map['nome'] as String,
      usuario: map['usuario'] as String,
      senha: map['senha'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserModel(nome: $nome, usuario: $usuario, senha: $senha)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.nome == nome &&
        other.usuario == usuario &&
        other.senha == senha;
  }

  @override
  int get hashCode => nome.hashCode ^ usuario.hashCode ^ senha.hashCode;
}
