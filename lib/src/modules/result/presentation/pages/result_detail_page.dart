import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/widgets/custom_appbar_widget.dart';
import '../../../../core/const/app_colors.dart';
import '../../../../core/widgets/custom_drawer_widget.dart';

class ResultDetailPage extends StatefulWidget {
  const ResultDetailPage({Key? key}) : super(key: key);

  @override
  State<ResultDetailPage> createState() => _ResultDetailPageState();
}

class _ResultDetailPageState extends State<ResultDetailPage> {
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: AppColors.secondary,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 32,
                right: 32,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/Paje.png',
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Stack(
                            children: [
                              Card(
                                margin: new EdgeInsets.only(left: 36.0),
                                child: Container(
                                  height: 124,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin:
                                                new EdgeInsets.only(left: 50.0),
                                            child: Text(
                                              'Processo:',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin:
                                                new EdgeInsets.only(left: 50.0),
                                            child: Text(
                                              'Magistrado:',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              '',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin:
                                                new EdgeInsets.only(left: 50.0),
                                            child: Text(
                                              'Vara:',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            margin:
                                                new EdgeInsets.only(left: 50.0),
                                            child: Text(
                                              'Classe:',
                                              style: TextStyle(
                                                color: AppColors.primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 25.0),
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.primary,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.gavel,
                                  color: AppColors.onPrimary,
                                  size: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24,
                          ),
                          child: Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'AgRg no AREsp 1747572',
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        '10/01/2018 - 16:19',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur id blandit nisi, euismod faucibus felis. Quisque mollis faucibus quam sit amet consectetur. Nulla venenatis, quam vel finibus consectetur, nisl neque gravida nibh, quis finibus libero erat et augue. Sed vitae dui nisi. Nam pulvinar risus nec tempus pellentesque. Duis suscipit, erat vitae rutrum suscipit, leo lectus porta mauris, mollis euismod enim sem ac massa. Mauris sed aliquet ipsum. Ut bibendum in augue ut laoreet. Integer egestas semper lorem sit amet malesuada. Integer purus lectus, viverra sodales convallis auctor, cursus et urna. Mauris quis purus et nulla suscipit fermentum. Mauris justo sapien, imperdiet a blandit placerat, tristique ut augue.',
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
      ),
    );
  }
}
