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
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppColors.secondary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/PajeFull.png',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                  ),
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                PrimaryButton(
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
    );
  }
}
