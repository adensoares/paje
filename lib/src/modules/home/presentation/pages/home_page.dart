import 'package:flutter/material.dart';
import 'package:paje/src/core/const/app_colors.dart';
import 'package:paje/src/core/widgets/custom_appbar_widget.dart';
import 'package:paje/src/core/widgets/custom_drawer_widget.dart';
import 'package:paje/src/core/widgets/primary_button_widget.dart';
import 'package:paje/src/core/widgets/searchbar_widget.dart';
import 'package:paje/src/core/widgets/secondary_button_widget.dart';
import 'package:paje/src/modules/result/presentation/pages/result_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Container(
            color: AppColors.secondary,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/PajeFull.png',
                  ),
                  Column(
                    children: [
                      SearchBar(),
                      PrimaryButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultListPage(),
                            ),
                          );
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
                        padding: const EdgeInsets.only(top: 16),
                        child: Image.asset(
                          'assets/images/TRF5.png',
                        ),
                      ),
                    ],
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
