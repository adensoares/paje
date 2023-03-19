import 'package:flutter/material.dart';
import 'package:paje/core/const/paje_colors.dart';
import 'package:paje/modules/atos/data/model/ato_model.dart';
import 'package:paje/modules/atos/data/repository/ato_repository.dart';
import 'package:paje/modules/atos/presentation/pages/ato_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAtosPage extends StatefulWidget {
  const MyAtosPage({Key? key}) : super(key: key);

  @override
  State<MyAtosPage> createState() => _MyAtosPageState();
}

class _MyAtosPageState extends State<MyAtosPage> {
  AtoRepository repository = AtoRepository();

  List<AtoModel> _favorites = [];
  List<AtoModel> _myAtos = [];
  String _name = 'Carregando...';

  @override
  void initState() {
    super.initState();
    _loadUser().then((value) {
      _loadMyAtos();
    });
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
    });
  }

  Future<void> _loadMyAtos() async {
    List<AtoModel> _result = [];

    _result = repository.atos
        .where((ato) =>
            ato.magistrado.toLowerCase().contains((_name.toLowerCase())))
        .toList();
    print(_result);
    print(_name.toLowerCase());
    setState(() {
      _myAtos = _result;
    });
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
        title: Text("Meus Atos Judiciais"),
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
              child: _myAtos.isNotEmpty
                  ? ListView.builder(
                      itemCount: _myAtos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => AtoDetailPage(
                                        atoModel: _myAtos[index],
                                      ),
                                    ),
                                  );
                                },
                                trailing: IconButton(
                                  icon: Icon(
                                    _favorites.contains(_myAtos[index])
                                        ? Icons.star
                                        : Icons.star_border,
                                    // color:
                                    //     _favorites.contains(_atosFound[index])
                                    //         ? Colors.yellow
                                    //         : PajeColors.customMaterialPrimary,
                                    color: PajeColors.customMaterialPrimary,
                                    size: 32,
                                  ),
                                  onPressed: () =>
                                      _toggleFavorite(_myAtos[index]),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                  child: Text(
                                    _myAtos[index].titulo,
                                    style: TextStyle(
                                      color: PajeColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  _myAtos[index].texto,
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
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            color: PajeColors.primary,
                            size: 150,
                          ),
                          Text(
                            "Nenhum Ato Judicial Encontrado",
                            style: TextStyle(
                              color: PajeColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
