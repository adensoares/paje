import 'package:flutter/material.dart';

import 'core/const/app_colors.dart';

import 'modules/login/presentation/pages/login_page.dart';
import 'modules/result/presentation/pages/result_list_page.dart';
import 'modules/auth/presentation/pages/splash_page.dart';
import 'modules/home/presentation/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAJE',
      theme: ThemeData(
        primarySwatch: AppColors.customMaterialPrimary,
      ),
      home: SplashPage(),
    );
  }
}
