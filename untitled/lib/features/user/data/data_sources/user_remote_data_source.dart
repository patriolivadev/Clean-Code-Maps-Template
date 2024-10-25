import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:untitled/core/services/http_service.dart';
import 'package:untitled/features/user/data/models/user_model.dart';
import 'package:untitled/features/user/domain/entities/user_entity.dart';

abstract class UserRemoteDataSourceBase {
  final HttpServiceBase http;

  UserRemoteDataSourceBase({required this.http});

  Future<User> getUser();
}

@Injectable(as: UserRemoteDataSourceBase)
class UserRemoteDataSource extends UserRemoteDataSourceBase {
  UserRemoteDataSource({required super.http});

  @override
  Future<User> getUser() async {
    const String url = 'https://randomuser.me/api/';
    final result = await http.get(url);

    final user = UserModel.fromJson(result['results'][0]);

    return user;
  }
}
