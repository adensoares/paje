import 'package:flutter/material.dart';
import 'package:paje/src/core/const/app_colors.dart';

class CustomFilterChip extends StatefulWidget {
  const CustomFilterChip({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<CustomFilterChip> createState() => _CustomFilterChipState();
}

class _CustomFilterChipState extends State<CustomFilterChip> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FilterChip(
        backgroundColor: AppColors.secondary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 2,
              color: AppColors.primary,
            )),
        label: Text(
          widget.text,
          style: TextStyle(
            color: selected ? AppColors.onPrimary : AppColors.onSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        selected: selected,
        onSelected: (bool value) {
          selected = value;
          setState(() {});
        },
        pressElevation: 2,
        selectedColor: AppColors.primary,
        checkmarkColor: AppColors.onPrimary,
      ),
    );
  }
}
