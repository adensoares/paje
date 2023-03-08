import 'package:flutter/material.dart';

import 'core/const/paje_colors.dart';

import 'modules/auth/presentation/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAJE',
      theme: ThemeData(
        primarySwatch: PajeColors.customMaterialPrimary,
      ),
      home: SplashPage(),
    );
  }
}
