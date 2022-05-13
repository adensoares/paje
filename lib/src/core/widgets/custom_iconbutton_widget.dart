import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:paje/src/core/const/app_colors.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    Key? key,
    required this.outlineIcon,
    required this.solidIcon,
  }) : super(key: key);

  final Widget outlineIcon;
  final Widget solidIcon;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isSelected ? widget.solidIcon : widget.outlineIcon,
      color: AppColors.primary,
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
