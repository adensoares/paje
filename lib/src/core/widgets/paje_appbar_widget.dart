import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../const/paje_colors.dart';

class PajeAppBar extends StatelessWidget implements PreferredSize {
  const PajeAppBar({Key? key, this.title}) : super(key: key);

  final Widget? title;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: PajeColors.primary),
      title: title,
      elevation: 0,
      backgroundColor: PajeColors.background,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.solidBell,
            color: PajeColors.primary,
          ),
        ),
      ],
    );
  }
}
