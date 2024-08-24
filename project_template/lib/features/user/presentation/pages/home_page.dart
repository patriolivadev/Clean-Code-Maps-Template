import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/core/services/dependencies_service.dart';
import 'package:project_template/features/user/presentation/manager/user_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = getIt<UserBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _bloc,
        listener: listener,
        builder: builder,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Project Template',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 5,
    );
  }

  Widget builder(context, state) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('HomePage'),),
      ],
    );
  }

  void listener(context, state) {
    switch(state.runtimeType){
      // Implement cases
    }
  }
}
