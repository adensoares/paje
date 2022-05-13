import 'package:flutter/material.dart';
import 'package:paje/src/core/const/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.keyboardType,
    this.labelText,
    this.hintText,
    this.helperText,
    required this.obscureText,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String? labelText;
  final String? helperText;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: keyboardType,
        onTap: onTap,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          helperText: helperText,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
