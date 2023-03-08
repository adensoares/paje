import 'package:flutter/material.dart';
import 'package:paje/src/core/const/paje_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: PajeColors.secondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Pesquisar',
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      child: Text('Filter Modal'),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.filter_list,
                color: PajeColors.customMaterialPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
