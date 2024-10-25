import 'package:core_encode/core_encode.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/features/user/domain/entities/user_entity.dart';
import 'package:untitled/features/user/domain/repositories/user_repository_base.dart';

@injectable
class GetUserUseCase extends UseCaseBase<User, NoParams> {
  final UserRepositoryBase userRepositoryBase;

  GetUserUseCase({required this.userRepositoryBase});

  @override
  Future<Either<Failure, User>> call(NoParams params){
    return userRepositoryBase.getUser();
  }

}