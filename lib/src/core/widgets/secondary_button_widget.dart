import 'package:flutter/material.dart';
import 'package:paje/src/core/const/paje_colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
          color: PajeColors.primary,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        backgroundColor: PajeColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: PajeColors.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
