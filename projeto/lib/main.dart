import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leitor_cbarra/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'MyApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MyApp(),
    ),
  );
}
