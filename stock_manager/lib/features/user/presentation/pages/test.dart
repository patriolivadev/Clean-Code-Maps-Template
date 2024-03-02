import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_manager/features/user/presentation/pages/home_page.dart';

class TestPage extends StatefulWidget {
  static const routeName = '/testPage';
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola'),
      ),
      body: Expanded(
          child: Column(
        children: [
          TextButton(
            onPressed: (){
              context.go(HomePage.routeName);
            },
            child: const Text('GoToHome'),
          )
        ],
      )),
    );
  }
}
