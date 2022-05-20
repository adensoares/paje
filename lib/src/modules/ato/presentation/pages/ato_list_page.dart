import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_iconbutton_widget.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/widgets/custom_drawer_widget.dart';
import '../../data/repositories/ato_repository.dart';
import 'ato_detail_page.dart';

class AtoListPage extends StatefulWidget {
  const AtoListPage({Key? key, required this.atos}) : super(key: key);
  final List atos;

  @override
  State<AtoListPage> createState() => _AtoListPageState();
}

class _AtoListPageState extends State<AtoListPage> {
  List newAtos = [];
  int _selectedIndex = 0;
  String tipoAto = 'despacho';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        tipoAto = 'despacho';
      } else if (index == 1) {
        tipoAto = 'sentenca';
      } else {
        tipoAto = 'decisao';
      }
      print(tipoAto);
      newAtos = widget.atos.where((o) => o.tipo == tipoAto).toList();
      print(newAtos.length);
    });
  }

  Widget _notFound() {
    if (tipoAto == 'despacho') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.faceFrown,
            size: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Text('Nenhum despacho encontrado'),
          ),
        ],
      );
    }
    if (tipoAto == 'sentenca') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.faceFrown,
            size: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Text('Nenhuma sentença encontrada'),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.faceFrown,
            size: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Text('Nenhuma decisão encontrada'),
          ),
        ],
      );
    }
  }

  @override
  void initState() {
    newAtos.addAll(widget.atos.where((o) => o.tipo == tipoAto).toList());
    print(newAtos.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 24,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/Paje.png',
              ),
              Expanded(
                child: newAtos.isNotEmpty
                    ? ListView.builder(
                        itemCount: newAtos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => AtoDetailPage(
                                                  atoModel: newAtos[index],
                                                )));
                                  },
                                  leading: CustomIconButton(
                                    outlineIcon: Icon(
                                      FontAwesomeIcons.bookmark,
                                    ),
                                    solidIcon: Icon(
                                      FontAwesomeIcons.solidBookmark,
                                    ),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 8,
                                    ),
                                    child: Text(
                                      newAtos[index].titulo,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  subtitle: Text(
                                    newAtos[index].texto,
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
                    : _notFound(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.stamp),
              ),
              label: 'Despacho',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.gavel),
              ),
              label: 'Sentença',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(FontAwesomeIcons.scaleUnbalanced),
              ),
              label: 'Decisão',
            ),
          ],
          backgroundColor: AppColors.background,
          elevation: 0,
          iconSize: 30,
          selectedFontSize: 16,
          unselectedItemColor: AppColors.unselectedIcon,
          selectedIconTheme: IconThemeData(
            size: 50,
          ),
          // unselectedIconTheme: IconThemeData(
          //   color: Colors.deepOrangeAccent,
          // ),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
