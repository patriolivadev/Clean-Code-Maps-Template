import 'package:core_encode/core_encode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/services/dependencies_service.dart';
import 'package:untitled/features/user/presentation/manager/user_bloc.dart';
import 'package:untitled/features/user/presentation/widgets/map_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserBloc bloc = getIt<UserBloc>();
  String name = '';
  String lastName = '';

  @override
  void initState() {
    bloc.add(ActionGetUser(noParams: NoParams()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocConsumer(
        bloc: bloc,
        listener: listener,
        builder: builder,
      ),
    );
  }

  void listener(context, state) {
    switch (state.runtimeType) {
      case const (OnGetUser):
        onGetUser(state);
      case const (OnGetUserFailure):
        onGetUserFailure(context);
    }
  }

  void onGetUser(state) {
    name = state.user.name;
    lastName = state.user.lastName;
  }

  void onGetUserFailure(context) {
    SnackBar snackBar = const SnackBar(
      content: Text('La petición falló!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget builder(context, state) {
    switch (state.runtimeType) {
      case const (OnLoading):
        return const Center(
          child: CircularProgressIndicator(),
        );
      default:
        return buildBody();
    }
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("La persona seleccionada fue:"),
          Text("Nombre: $name"),
          Text("Apellido: $lastName"),
          const SizedBox(
            height: 50,
          ),
          buildMapWidget(),
        ],
      ),
    );
  }

  SizedBox buildMapWidget() {
    return const SizedBox(
      height: 500,
      width: 500,
      child: Center(child: MapWidget()),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(40, 40),
      child: Container(
        color: Colors.lightBlueAccent,
        child: const Center(child: Text("APPBAR")),
      ),
    );
  }
}
