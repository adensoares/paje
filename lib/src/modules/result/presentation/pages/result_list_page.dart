import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_detail_page.dart';
import '../../../../core/widgets/custom_iconbutton_widget.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/widgets/custom_drawer_widget.dart';

class ResultListPage extends StatefulWidget {
  const ResultListPage({Key? key}) : super(key: key);

  @override
  State<ResultListPage> createState() => _ResultListPageState();
}

class _ResultListPageState extends State<ResultListPage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(
        child: Container(
          color: AppColors.secondary,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                  child: ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultDetailPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            children: [
                              ListTile(
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
                                    'Three-line ListTile',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  'A sufficiently long subtitle warrants three lines.',
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
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
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
          iconSize: 40,
          selectedFontSize: 20,
          selectedIconTheme: IconThemeData(
            size: 72,
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
