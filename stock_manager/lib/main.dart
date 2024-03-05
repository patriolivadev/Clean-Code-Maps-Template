import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:stock_manager/core/routes/router.dart';
import 'package:stock_manager/core/services/dependencies_service.dart';
import 'package:stock_manager/core/utils/themes.dart';
import 'package:stock_manager/firebase_options.dart';

void main() async {
  await configureDependencies(Environment.dev);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Hace que la barra de estado sea transparente
      statusBarIconBrightness: Brightness.dark, // Muestra los íconos en la barra de estado en color oscuro
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      routerConfig: router,
    );
  }
}
