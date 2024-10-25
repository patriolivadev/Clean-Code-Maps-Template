// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:untitled/core/services/dependencies_service.dart' as _i495;
import 'package:untitled/core/services/http_service.dart' as _i1008;
import 'package:untitled/features/user/data/data_sources/user_remote_data_source.dart'
    as _i802;
import 'package:untitled/features/user/data/repositories/user_respository.dart'
    as _i464;
import 'package:untitled/features/user/domain/repositories/user_repository_base.dart'
    as _i653;
import 'package:untitled/features/user/domain/use_cases/get_user_use_case.dart'
    as _i8;
import 'package:untitled/features/user/presentation/manager/user_bloc.dart'
    as _i509;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i519.Client>(() => injectableModule.client);
    gh.factory<_i1008.HttpServiceBase>(
        () => _i1008.HttpService(http: gh<_i519.Client>()));
    gh.factory<_i802.UserRemoteDataSourceBase>(
        () => _i802.UserRemoteDataSource(http: gh<_i1008.HttpServiceBase>()));
    gh.factory<_i653.UserRepositoryBase>(() =>
        _i464.UserRepository(remote: gh<_i802.UserRemoteDataSourceBase>()));
    gh.factory<_i8.GetUserUseCase>(() =>
        _i8.GetUserUseCase(userRepositoryBase: gh<_i653.UserRepositoryBase>()));
    gh.factory<_i509.UserBloc>(
        () => _i509.UserBloc(getUserUseCase: gh<_i8.GetUserUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i495.InjectableModule {}
