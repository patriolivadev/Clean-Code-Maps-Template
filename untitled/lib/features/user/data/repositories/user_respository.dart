import 'package:core_encode/core_encode.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/features/user/domain/entities/user_entity.dart';
import 'package:untitled/features/user/domain/repositories/user_repository_base.dart';

@Injectable(as: UserRepositoryBase)
class UserRepository extends UserRepositoryBase {
  UserRepository({required super.remote});

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
    User user = await remote.getUser();
    return Right(user);
    } on Failure catch (e) {
    return Left(e);
    } catch (e) {
    return Left(UnhandledFailure(message: '$e'));
    }
  }

}