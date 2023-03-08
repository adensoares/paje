import 'package:flutter/material.dart';
import 'package:paje/src/core/const/paje_colors.dart';

class PajeFilterChip extends StatefulWidget {
  const PajeFilterChip({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<PajeFilterChip> createState() => _PajeFilterChipState();
}

class _PajeFilterChipState extends State<PajeFilterChip> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FilterChip(
        backgroundColor: PajeColors.secondary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(
              width: 2,
              color: PajeColors.primary,
            )),
        label: Text(
          widget.text,
          style: TextStyle(
            color: selected ? PajeColors.onPrimary : PajeColors.onSecondary,
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
        selectedColor: PajeColors.primary,
        checkmarkColor: PajeColors.onPrimary,
      ),
    );
  }
}
