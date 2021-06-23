
import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_screen.dart';
import 'package:payflow/modules/login/login_screen.dart';
import 'package:payflow/modules/splash/splash_screen.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash':(context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}