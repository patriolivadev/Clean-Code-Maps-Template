import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_manager/core/services/dependencies_service.dart';
import 'package:stock_manager/features/user/presentation/manager/user_bloc.dart';
import 'package:stock_manager/features/user/presentation/pages/test.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt<UserBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('StockManager'),
        backgroundColor: Colors.purple,
        elevation: 10,
        leading: const DrawerButton(
          onPressed: null,
        ),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _bloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return  Column(
            children: [
              TextButton(
                onPressed: (){
                  context.go(TestPage.routeName);
                },
                child: const Text('GoToTest'),
              )
            ],
          );
        },
      ),
    );
  }
}
