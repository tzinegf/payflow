import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/bar_code_scanner/bar_code_scanner_screen.dart';
import 'package:payflow/modules/home/home_screen.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto.dart';
import 'package:payflow/modules/login/login_screen.dart';
import 'package:payflow/modules/splash/splash_screen.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class MyApp extends StatelessWidget {
  MyApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      theme: ThemeData(
          primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(user: ModalRoute.of(context)!.settings.arguments as UserModel,),
        '/login': (context) => LoginScreen(),
        '/barcodescanner': (context) => BarCodeScannerScreen(),
        '/insertboletopage': (context) => InsertBoleto(
          barcode: ModalRoute.of(context)!= null ? ModalRoute.of(context)!.settings.arguments.toString(): null,
        )
      },
    );
  }
}
