import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../const/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({Key? key, this.title}) : super(key: key);

  final Widget? title;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: AppColors.primary),
      title: title,
      elevation: 0,
      backgroundColor: AppColors.background,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            FontAwesomeIcons.solidBell,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
