import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:paje/src/core/const/paje_colors.dart';
import 'package:paje/src/core/widgets/searchbar_widget.dart';

import 'package:paje/src/modules/atos/data/model/ato_model.dart';
import 'package:paje/src/modules/atos/data/repository/ato_repository.dart';
import 'package:paje/src/modules/atos/presentation/pages/ato_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  AtoRepository repository = AtoRepository();
  final _searchController = TextEditingController();

  List<AtoModel> _favorites = [];
  List<AtoModel> _atosFound = [];

  // void _search(String value) {
  //   atos = repository.atos
  //       .where(
  //           (ato) => ato.titulo.toLowerCase().contains((value.toLowerCase())))
  //       .toList();
  //   print(atos);
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => AtoListPage(atos: atos)));
  // }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAtosJson = _favorites.map((ato) => ato.toJson()).toList();
    await prefs.setStringList('favoriteAtos', favoriteAtosJson);
  }

  void _handleFavorite(AtoModel ato) {
    setState(() {
      if (_favorites.contains(ato)) {
        _favorites.remove(ato);
      } else {
        _favorites.add(ato);
      }
    });
    _saveFavorites();
  }

  // void _handleFavorite(AtoModel ato) async {
  //   setState(() {
  //     if (_favorites.contains(ato)) {
  //       _favorites.remove(ato);
  //     } else {
  //       _favorites.add(ato);
  //     }
  //   });

  //   // Salvar a lista de favoritos no SharedPreferences
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setStringList(
  //       'favorites', _favorites.map((e) => e.toJson()).toList());
  // }

  void _search(String value) {
    List<AtoModel> _result = [];

    if (value.isEmpty) {
      _result = [];
    } else {
      _result = repository.atos
          .where(
              (ato) => ato.titulo.toLowerCase().contains((value.toLowerCase())))
          .toList();
    }
    setState(() {
      _atosFound = _result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca por Ato Judicial"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 32,
              ),
              child: SearchBar(
                controller: _searchController,
                onChanged: ((value) => _search(value)),
              ),
            ),
            Expanded(
              child: _atosFound.isNotEmpty
                  ? ListView.builder(
                      itemCount: _atosFound.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AtoDetailPage(
                                        atoModel: _atosFound[index],
                                      ),
                                    ),
                                  );
                                },
                                trailing: IconButton(
                                  icon: Icon(
                                    _favorites.contains(_atosFound[index])
                                        ? Icons.star
                                        : Icons.star_border,
                                    color:
                                        _favorites.contains(_atosFound[index])
                                            ? Colors.yellow
                                            : PajeColors.customMaterialPrimary,
                                    size: 32,
                                  ),
                                  onPressed: () =>
                                      _handleFavorite(_atosFound[index]),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                  child: Text(
                                    _atosFound[index].titulo,
                                    style: TextStyle(
                                      color: PajeColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  _atosFound[index].texto,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                isThreeLine: true,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 65,
                                ),
                                child: Divider(),
                              )
                            ],
                          ),
                        );
                      })
                  : Center(child: Text("Nenhum Ato Judicial encontrado")),
            ),
            // PrimaryButton(
            //   onPressed: () {
            //     _search(_searchController.text);
            //   },
            //   text: 'Buscar',
            // ),
            // Builder(builder: (context) {
            //   return SecondaryButton(
            //     text: 'Filtrar',
            //     onPressed: () {
            //       Scaffold.of(context).openDrawer();
            //     },
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}
