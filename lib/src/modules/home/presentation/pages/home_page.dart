import 'package:flutter/material.dart';

import '../../../../core/const/app_colors.dart';
import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/widgets/custom_drawer_widget.dart';
import '../../../../core/widgets/primary_button_widget.dart';
import '../../../../core/widgets/searchbar_widget.dart';
import '../../../../core/widgets/secondary_button_widget.dart';
import '../../../ato/presentation/pages/ato_list_page.dart';
import '../../../ato/data/model/ato_model.dart';
import '../../../ato/data/repositories/ato_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AtoRepository repository = AtoRepository();
  final _searchController = TextEditingController();

  List<AtoModel> atos = [];

  void _search(String value) {
    atos = repository.atos
        .where((o) => o.titulo.toLowerCase().contains((value.toLowerCase())))
        .toList();
    print(atos);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AtoListPage(atos: atos)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/PajeFull.png',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                      bottom: 16,
                    ),
                    child: SearchBar(
                      controller: _searchController,
                    ),
                  ),
                  PrimaryButton(
                    onPressed: () {
                      _search(_searchController.text);
                    },
                    text: 'Buscar',
                  ),
                  Builder(builder: (context) {
                    return SecondaryButton(
                      text: 'Filtrar',
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                    ),
                    child: Image.asset(
                      'assets/images/TRF5.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
