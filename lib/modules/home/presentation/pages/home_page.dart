import 'package:flutter/material.dart';
import 'package:paje/core/const/paje_colors.dart';
import 'package:paje/core/widgets/paje_drawer_widget.dart';
import 'package:paje/modules/favorites/presentation/pages/favorites_page.dart';
import 'package:paje/modules/my_atos/presentation/pages/my_atos_page.dart';
import 'package:paje/modules/search/presentation/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

class _HomePageState extends State<HomePage> {
  final _categories = [
    Category(name: "Busca por Atos Judiciais", icon: Icons.search),
    Category(name: "Favoritos", icon: Icons.star),
    Category(name: "Meus Atos Judiciais", icon: Icons.description),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/images/Paje_w.png',
            width: 100,
          ),
          centerTitle: true,
        ),
        drawer: PajeDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              children: [
                CustomScrollView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  slivers: [
                    SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              if (_categories[index].name ==
                                  'Busca por Atos Judiciais') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchPage(),
                                  ),
                                );
                              } else if (_categories[index].name ==
                                  'Favoritos') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FavoritesPage(),
                                  ),
                                );
                              } else if (_categories[index].name ==
                                  'Meus Atos Judiciais') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyAtosPage(),
                                  ),
                                );
                              }
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _categories[index].icon,
                                  size: 50.0,
                                  color: PajeColors.customMaterialPrimary,
                                ),
                                SizedBox(height: 10.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Container(
                                    height: 30,
                                    child: Text(
                                      _categories[index].name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: PajeColors.customMaterialPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }, childCount: _categories.length),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
