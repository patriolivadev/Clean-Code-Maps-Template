import 'package:core_encode/core_encode.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/features/user/data/data_sources/user_remote_data_source.dart';
import 'package:untitled/features/user/domain/entities/user_entity.dart';

abstract class UserRepositoryBase {
  final UserRemoteDataSourceBase remote;

  UserRepositoryBase({required this.remote});

Future<Either<Failure, User>> getUser();
}