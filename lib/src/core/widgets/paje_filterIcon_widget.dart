import 'package:flutter/material.dart';
import 'package:paje/src/core/const/paje_colors.dart';

class PajeFilterButton extends StatefulWidget {
  const PajeFilterButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onSelect,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function(bool isSelected) onSelect;

  @override
  _PajeFilterButtonState createState() => _PajeFilterButtonState();
}

class _PajeFilterButtonState extends State<PajeFilterButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onSelect(_isSelected);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _isSelected ? PajeColors.primary : PajeColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
          color: _isSelected ? PajeColors.primary : Colors.transparent,
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: _isSelected ? Colors.white : PajeColors.primary,
            ),
            SizedBox(width: 8),
            Text(
              widget.title,
              style: TextStyle(
                color: _isSelected ? Colors.white : PajeColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
