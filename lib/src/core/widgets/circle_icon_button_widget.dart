import 'package:flutter/material.dart';

import 'package:paje/src/core/const/paje_colors.dart';

class CircleIconButton extends StatefulWidget {
  const CircleIconButton({
    Key? key,
    required this.outlineIcon,
    required this.solidIcon,
  }) : super(key: key);

  final Widget outlineIcon;
  final Widget solidIcon;

  @override
  State<CircleIconButton> createState() => _CircleIconButtonState();
}

class _CircleIconButtonState extends State<CircleIconButton> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: PajeColors.primary,
      child: IconButton(
        splashRadius: 25,
        icon: isSelected ? widget.solidIcon : widget.outlineIcon,
        color: Colors.white,
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
      ),
    );
  }
}
