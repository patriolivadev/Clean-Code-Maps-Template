import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:market_mate/core/services/dependencies_service.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.init(environment: env);
  getIt.allowReassignment = true;
  return getIt;
}

@module
abstract class InjectableModule {
  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}

