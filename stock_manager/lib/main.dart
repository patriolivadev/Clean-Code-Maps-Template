import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stock_manager/core/routes/router.dart';
import 'package:stock_manager/core/services/dependencies_service.dart';

void main() async {
  await configureDependencies(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      routerConfig: router,
    );
  }
}
