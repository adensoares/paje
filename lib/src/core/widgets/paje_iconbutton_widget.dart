import 'package:flutter/material.dart';

import 'package:paje/src/core/const/paje_colors.dart';

class PajeIconButton extends StatefulWidget {
  const PajeIconButton({
    Key? key,
    required this.outlineIcon,
    required this.solidIcon,
  }) : super(key: key);

  final Widget outlineIcon;
  final Widget solidIcon;

  @override
  State<PajeIconButton> createState() => _PajeIconButtonState();
}

class _PajeIconButtonState extends State<PajeIconButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isSelected ? widget.solidIcon : widget.outlineIcon,
      iconSize: 32,
      color: PajeColors.primary,
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
    );
  }
}
