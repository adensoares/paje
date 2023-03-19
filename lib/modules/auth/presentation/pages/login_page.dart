import 'package:flutter/material.dart';
import 'package:paje/modules/home/presentation/pages/home_page.dart';
import 'package:paje/modules/auth/data/model/user_model.dart';
import 'package:paje/modules/auth/data/repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/const/paje_colors.dart';
import '../../../../core/widgets/paje_textFormField_widget.dart';
import '../../../../core/widgets/paje_elevatedButton_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userRepository = UserRepository();
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  void _saveUser(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: PajeColors.background,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/PajeFull.png',
                    ),
                    PajeTextFormField(
                      labelText: 'Usuário',
                      obscureText: false,
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe o usuário.';
                        }
                        return null;
                      },
                    ),
                    PajeTextFormField(
                      labelText: 'Senha',
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, informe a senha.';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 24.0,
                      ),
                      child: PajeElevatedButton(
                        text: 'Entrar',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            UserModel? user = _userRepository.login(
                              _usernameController.text,
                              _passwordController.text,
                            );
                            if (user != null) {
                              _saveUser(user.nome);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            } else {
                              _showDialog(
                                'Erro',
                                'Usuário ou senha incorretos.',
                              );
                            }
                          }
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Esqueceu a senha?',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        foregroundColor: PajeColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
