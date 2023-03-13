import 'package:flutter/material.dart';
import 'package:paje/src/modules/favorites/presentation/pages/favorites_page.dart';
import 'package:paje/src/modules/login/presentation/pages/login_page.dart';
import 'package:paje/src/modules/search/presentation/pages/search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PajeDrawer extends StatefulWidget {
  const PajeDrawer({Key? key}) : super(key: key);

  @override
  State<PajeDrawer> createState() => _PajeDrawerState();
}

class _PajeDrawerState extends State<PajeDrawer> {
  String _name = 'Carregando...';
  String _email = '';

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _email = prefs.getString('email') ?? '';
    });
  }

  String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    print(nameSplit);
    String initials = nameSplit[0][0];
    if (nameSplit.length > 1) {
      initials += nameSplit[1][0];
    }
    return initials.toUpperCase();
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Olá, $_name"),
            accountEmail: Text("$_email"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                getInitials(_name),
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Busca Processual'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoritos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(),
                ),
              );
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configurações"),
            onTap: () {
              // Navegar para a tela de configurações
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda e suporte"),
            onTap: () {
              // Navegar para a tela de ajuda e suporte
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Sobre"),
            onTap: () {
              // Navegar para a tela de informações sobre a empresa ou aplicativo
            },
          ),
          Divider(
            height: 2,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Sair"),
            onTap: () {
              _logout();
            },
          ),
        ],
      ),
    );
  }
}
