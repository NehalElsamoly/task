// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;
import 'package:task/config/base_local_data_source/base_local_data_source.dart'
    as _i36;
import 'package:task/config/base_remote_data_source/base_remote_data_source.dart'
    as _i120;
import 'package:task/config/base_repository/base_repository.dart' as _i286;
import 'package:task/config/storages/secure_storage.dart' as _i628;
import 'package:task/core/api/api_consumer.dart' as _i33;
import 'package:task/core/api/dio_consumer.dart' as _i835;
import 'package:task/core/api/interceptors.dart' as _i934;
import 'package:task/core/api/network_info.dart' as _i846;
import 'package:task/core/services/third_party_instance.dart' as _i184;
import 'package:task/feature/users/data/user_data_source/remote/user_remote_data_source.dart'
    as _i115;
import 'package:task/feature/users/data/user_repository/user_repository_impl.dart'
    as _i334;
import 'package:task/feature/users/domain/user_base_repository/user_reposotry.dart'
    as _i229;
import 'package:task/feature/users/domain/users_usecases/get_user_details.dart'
    as _i167;
import 'package:task/feature/users/domain/users_usecases/get_users.dart'
    as _i745;
import 'package:task/feature/users/presentation/view_model/user_bloc.dart'
    as _i80;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i934.AppInterceptors>(() => _i934.AppInterceptors());
    gh.lazySingleton<_i361.Dio>(() => injectableModule.dio);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectableModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => injectableModule.flutterSecureStorage,
    );
    gh.lazySingleton<_i846.NetworkInfo>(
      () => _i846.NetworkInfoImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i286.BaseRepository>(() => _i286.BaseRepositoryImpl());
    gh.lazySingleton<_i36.BaseLocalDataSource>(
      () => _i36.BaseLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i33.ApiConsumer>(
      () => _i835.DioConsumer(client: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i628.BaseAppSecurityData>(
      () => _i628.AppSecurityData(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i120.BaseRemoteDataSource>(
      () => _i120.BaseRemoteDataSourceImpl(
        apiConsumer: gh<_i33.ApiConsumer>(),
        networkInfo: gh<_i846.NetworkInfo>(),
      ),
    );
    gh.lazySingleton<_i115.BaseUsersRemoteDataSource>(
      () => _i115.UsersRemoteDataSourceImpl(
        baseRemoteDataSource: gh<_i120.BaseRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i229.UserRepository>(
      () => _i334.UsersRepositoryImpl(
        remoteDataSource: gh<_i115.BaseUsersRemoteDataSource>(),
        baseRepository: gh<_i286.BaseRepository>(),
      ),
    );
    gh.lazySingleton<_i745.GetUsers>(
      () => _i745.GetUsers(gh<_i229.UserRepository>()),
    );
    gh.lazySingleton<_i167.GetUserDetails>(
      () => _i167.GetUserDetails(gh<_i229.UserRepository>()),
    );
    gh.factory<_i80.UserBloc>(
      () => _i80.UserBloc(
        getUsers: gh<_i745.GetUsers>(),
        getUserDetails: gh<_i167.GetUserDetails>(),
      ),
    );
    return this;
  }
}

class _$InjectableModule extends _i184.InjectableModule {}
