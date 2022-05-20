import 'package:flutter/material.dart';

import 'core/const/app_colors.dart';

import 'modules/auth/presentation/pages/splash_page.dart';

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
