import 'package:flutter/material.dart';
import 'package:leitor_cbarra/modules/ForgotPassword/forgotPassword_page.dart';
import 'package:leitor_cbarra/modules/Login/login_page.dart';
import 'package:leitor_cbarra/routes/routes.dart';
import 'package:leitor_cbarra/widgets/auth_check.dart';

import 'modules/LeitorCode/leitor_code_page.dart';
import 'modules/Splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.authCheck,
      routes: {
        AppRoutes.splash: (context) => SplashPage(),
        AppRoutes.authCheck: (context) => AuthCheck(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.forgotPassword: (context) => ForgotPasswordPage(),
        AppRoutes.readingCode: (context) => CodeReadingPage()
      },
    );
  }
}
