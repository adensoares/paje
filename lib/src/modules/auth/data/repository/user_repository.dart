import 'package:paje/src/modules/auth/data/model/user_model.dart';

class UserRepository {
  List<UserModel> users = [
    UserModel(
      nome: "Ana Silva",
      usuario: "anasilva",
      senha: "anasilva",
    ),
    UserModel(
      nome: "Pedro Santos",
      usuario: "pedrosantos",
      senha: "pedrosantos",
    ),
    UserModel(
      nome: "Lucas Oliveira",
      usuario: "lucasoliveira",
      senha: "lucasoliveira",
    ),
    UserModel(
      nome: "Isabela Rodrigues",
      usuario: "isabelarodrigues",
      senha: "isabelarodrigues",
    ),
    UserModel(
      nome: "Gustavo Costa",
      usuario: "gustavocosta",
      senha: "gustavocosta",
    ),
  ];

  UserModel? login(String username, String password) {
    for (UserModel user in users) {
      if (user.usuario == username && user.senha == password) {
        return user;
      }
    }
    return null;
  }
}
