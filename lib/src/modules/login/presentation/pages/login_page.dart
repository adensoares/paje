import 'package:flutter/material.dart';
import 'package:paje/src/modules/home/presentation/pages/home_page.dart';

import '../../../../core/const/paje_colors.dart';
import '../../../../core/widgets/paje_text_form_field_widget.dart';
import '../../../../core/widgets/primary_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/PajeFull.png',
                  ),
                  PajeTextFormField(
                    labelText: 'Login',
                    obscureText: false,
                    onTap: () {},
                  ),
                  PajeTextFormField(
                    labelText: 'Senha',
                    obscureText: true,
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24.0,
                    ),
                    child: PrimaryButton(
                      text: 'Entrar',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
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
    );
  }
}
