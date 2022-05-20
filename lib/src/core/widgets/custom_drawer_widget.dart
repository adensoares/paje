import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paje/src/core/const/app_colors.dart';
import 'package:paje/src/core/widgets/custom_filterchip_widget.dart';
import 'package:paje/src/core/widgets/custom_text_form_field_widget.dart';
import 'package:paje/src/core/widgets/primary_button_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Filtros',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Busca Avançada',
                      ),
                    ),
                  ],
                ),
                // IconButton(
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                //   icon: Icon(
                //     FontAwesomeIcons.x,
                //     size: 16,
                //   ),
                // )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    obscureText: false,
                    labelText: 'Assunto',
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    labelText: 'Processo',
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    labelText: 'Magistrado',
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    labelText: 'Classe',
                  ),
                  CustomTextFormField(
                    obscureText: false,
                    labelText: 'Vara',
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomFilterChip(
                  text: 'e',
                ),
                CustomFilterChip(
                  text: 'ou',
                ),
                CustomFilterChip(
                  text: 'adj',
                ),
                CustomFilterChip(
                  text: 'não',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomFilterChip(
                  text: 'prox',
                ),
                CustomFilterChip(
                  text: 'mesmo',
                ),
                CustomFilterChip(
                  text: 'com',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(onPressed: () {}, text: 'Aplicar'),
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Fechar',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: TextButton.styleFrom(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
