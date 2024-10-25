import 'package:untitled/features/user/domain/entities/user_entity.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.lastName,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
    };
  }

  factory UserModel.fromJson(Map map) {
    return UserModel(
      name: map['name']['first'],
      lastName: map['name']['last'],
    );
  }
}
