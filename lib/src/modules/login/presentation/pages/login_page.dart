import 'package:flutter/material.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';
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
        backgroundColor: AppColors.background,
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
                  CustomTextFormField(
                    labelText: 'Login',
                    obscureText: false,
                    onTap: () {},
                  ),
                  CustomTextFormField(
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
                      primary: AppColors.primary,
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
