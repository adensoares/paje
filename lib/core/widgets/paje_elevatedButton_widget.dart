import 'package:flutter/material.dart';
import 'package:paje/core/const/paje_colors.dart';

class PajeElevatedButton extends StatelessWidget {
  const PajeElevatedButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        backgroundColor: PajeColors.primary,
      ),
    );
  }
}
