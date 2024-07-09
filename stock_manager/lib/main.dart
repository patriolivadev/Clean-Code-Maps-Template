import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:stock_manager/core/routes/router.dart';
import 'package:stock_manager/core/services/dependencies_service.dart';
import 'package:stock_manager/core/utils/themes.dart';

void main() async {
  await configureDependencies(Environment.dev);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      routerConfig: router,
    );
  }
}
