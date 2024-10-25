// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:market_mate/core/services/dependencies_service.dart' as _i1026;
import 'package:market_mate/core/services/firestore_service.dart' as _i570;
import 'package:market_mate/features/product/presentation/manager/product_bloc.dart'
    as _i143;
import 'package:market_mate/features/sales/data/data_sources/sales_data_source.dart'
    as _i636;
import 'package:market_mate/features/sales/data/repositories/sales_repository.dart'
    as _i1035;
import 'package:market_mate/features/sales/domain/repositories/sales_repository_base.dart'
    as _i680;
import 'package:market_mate/features/sales/domain/use_cases/get_sales_use_case.dart'
    as _i558;
import 'package:market_mate/features/sales/presentation/manager/sales_bloc.dart'
    as _i823;
import 'package:market_mate/features/suppliers/presentation/manager/suppliers_bloc.dart'
    as _i687;
import 'package:market_mate/features/user/presentation/manager/user_bloc.dart'
    as _i969;

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
    gh.factory<_i143.ProductBloc>(() => _i143.ProductBloc());
    gh.factory<_i687.SuppliersBloc>(() => _i687.SuppliersBloc());
    gh.factory<_i969.UserBloc>(() => _i969.UserBloc());
    gh.singleton<_i974.FirebaseFirestore>(() => injectableModule.firestore);
    gh.factory<_i570.FirestoreServiceBase>(
        () => _i570.FirestoreService(firestore: gh<_i974.FirebaseFirestore>()));
    gh.factory<_i636.SalesRemoteDataSourceBase>(() =>
        _i636.SalesRemoteDataSource(
            firestoreService: gh<_i570.FirestoreServiceBase>()));
    gh.factory<_i680.SalesRepositoryBase>(() =>
        _i1035.SalesRepository(remote: gh<_i636.SalesRemoteDataSourceBase>()));
    gh.factory<_i558.GetSalesUseCase>(() =>
        _i558.GetSalesUseCase(repository: gh<_i680.SalesRepositoryBase>()));
    gh.factory<_i823.SalesBloc>(
        () => _i823.SalesBloc(getSalesUseCase: gh<_i558.GetSalesUseCase>()));
    return this;
  }
}

class _$InjectableModule extends _i1026.InjectableModule {}
