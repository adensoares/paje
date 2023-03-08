import 'package:flutter/material.dart';
import 'package:paje/src/core/const/paje_colors.dart';
import 'package:paje/src/modules/atos/data/model/ato_model.dart';
import 'package:paje/src/modules/atos/presentation/pages/ato_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<AtoModel> _favorites = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAtosJson = prefs.getStringList('favoriteAtos');
    if (favoriteAtosJson != null) {
      final List<AtoModel> favoriteAtos =
          favoriteAtosJson.map((json) => AtoModel.fromJson(json)).toList();
      setState(() {
        _favorites = favoriteAtos;
      });
    }
  }

  void _toggleFavorite(AtoModel ato) {
    setState(() {
      if (_favorites.contains(ato)) {
        _favorites.remove(ato);
      } else {
        _favorites.add(ato);
      }
    });
    _saveFavorites();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteAtosJson = _favorites.map((ato) => ato.toJson()).toList();
    await prefs.setStringList('favoriteAtos', favoriteAtosJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favoritos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: _favorites.isNotEmpty
                  ? ListView.builder(
                      itemCount: _favorites.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AtoDetailPage(
                                        atoModel: _favorites[index],
                                      ),
                                    ),
                                  );
                                },
                                trailing: IconButton(
                                  icon: Icon(
                                    _favorites.contains(_favorites[index])
                                        ? Icons.star
                                        : Icons.star_border,
                                    color:
                                        _favorites.contains(_favorites[index])
                                            ? Colors.yellow
                                            : PajeColors.customMaterialPrimary,
                                    size: 32,
                                  ),
                                  onPressed: () =>
                                      _toggleFavorite(_favorites[index]),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                  child: Text(
                                    _favorites[index].titulo,
                                    style: TextStyle(
                                      color: PajeColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  _favorites[index].texto,
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
          ],
        ),
      ),
    );
  }
}
