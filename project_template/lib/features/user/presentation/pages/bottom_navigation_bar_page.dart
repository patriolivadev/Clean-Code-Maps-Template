import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/core/services/dependencies_service.dart';
import 'package:project_template/features/user/presentation/manager/user_bloc.dart';

class BottomNavigationBarPage extends StatefulWidget {
  static const routeName = '/';
  final Widget child;

  const BottomNavigationBarPage({
    super.key,
    required this.child,
  });

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final _bloc = getIt<UserBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        bloc: _bloc,
        listener: listener,
        builder: builder,
      ),
    );
  }

  Widget builder(context, state) {
    return Column(
      children: [
        Expanded(child: widget.child),
      ],
    );
  }

  void listener(context, state) {
    // TODO: implement listener
  }
}
