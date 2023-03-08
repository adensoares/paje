import 'package:flutter/material.dart';
import 'package:paje/src/core/widgets/paje_filterchip_widget.dart';
import 'package:paje/src/core/widgets/paje_text_form_field_widget.dart';
import 'package:paje/src/core/widgets/primary_button_widget.dart';

class PajeDrawer extends StatelessWidget {
  const PajeDrawer({Key? key}) : super(key: key);

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
                  PajeTextFormField(
                    obscureText: false,
                    labelText: 'Assunto',
                  ),
                  PajeTextFormField(
                    obscureText: false,
                    labelText: 'Processo',
                  ),
                  PajeTextFormField(
                    obscureText: false,
                    labelText: 'Magistrado',
                  ),
                  PajeTextFormField(
                    obscureText: false,
                    labelText: 'Classe',
                  ),
                  PajeTextFormField(
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
                PajeFilterChip(
                  text: 'e',
                ),
                PajeFilterChip(
                  text: 'ou',
                ),
                PajeFilterChip(
                  text: 'adj',
                ),
                PajeFilterChip(
                  text: 'não',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PajeFilterChip(
                  text: 'prox',
                ),
                PajeFilterChip(
                  text: 'mesmo',
                ),
                PajeFilterChip(
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
