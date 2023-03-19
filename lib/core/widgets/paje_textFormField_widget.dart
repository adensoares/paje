import 'package:flutter/material.dart';
import 'package:paje/core/const/paje_colors.dart';

class PajeTextFormField extends StatelessWidget {
  const PajeTextFormField({
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.helperText,
    required this.obscureText,
    this.onTap,
    Key? key,
    this.controller,
    this.validator,
  }) : super(key: key);

  final String? labelText;
  final String? helperText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onTap: onTap,
        cursorColor: PajeColors.primary,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          helperText: helperText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: PajeColors.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
