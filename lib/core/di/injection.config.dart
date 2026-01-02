// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:glimm/core/di/injection.dart' as _i18;
import 'package:glimm/core/encryption/crypto_service.dart' as _i4;
import 'package:glimm/core/network/api_client.dart' as _i9;
import 'package:glimm/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i10;
import 'package:glimm/features/auth/data/datasources/firebase_auth_datasource.dart'
    as _i6;
import 'package:glimm/features/auth/data/repositories/auth_repository_impl.dart'
    as _i12;
import 'package:glimm/features/auth/domain/repositories/auth_repository.dart'
    as _i11;
import 'package:glimm/features/auth/domain/usecases/get_current_user.dart'
    as _i14;
import 'package:glimm/features/auth/domain/usecases/sign_in_with_google.dart'
    as _i15;
import 'package:glimm/features/auth/domain/usecases/sign_out.dart' as _i16;
import 'package:glimm/features/auth/presentation/bloc/auth_bloc.dart' as _i17;
import 'package:glimm/features/diary/data/datasources/diary_local_datasource.dart'
    as _i5;
import 'package:glimm/features/diary/data/datasources/diary_remote_datasource.dart'
    as _i13;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Client>(() => registerModule.httpClient);
    gh.lazySingleton<_i4.CryptoService>(() => _i4.CryptoService());
    gh.lazySingleton<_i5.DiaryLocalDataSource>(
        () => _i5.DiaryLocalDataSourceImpl());
    gh.lazySingleton<_i6.FirebaseAuthDataSource>(
        () => _i6.FirebaseAuthDataSourceImpl());
    gh.lazySingleton<_i7.FlutterSecureStorage>(
        () => registerModule.secureStorage);
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i9.ApiClient>(() => _i9.ApiClient(gh<_i3.Client>()));
    gh.lazySingleton<_i10.AuthRemoteDataSource>(
        () => _i10.AuthRemoteDataSourceImpl(gh<_i9.ApiClient>()));
    gh.lazySingleton<_i11.AuthRepository>(() => _i12.AuthRepositoryImpl(
          gh<_i6.FirebaseAuthDataSource>(),
          gh<_i10.AuthRemoteDataSource>(),
        ));
    gh.lazySingleton<_i13.DiaryRemoteDataSource>(
        () => _i13.DiaryRemoteDataSourceImpl(gh<_i9.ApiClient>()));
    gh.lazySingleton<_i14.GetCurrentUser>(
        () => _i14.GetCurrentUser(gh<_i11.AuthRepository>()));
    gh.lazySingleton<_i15.SignInWithGoogle>(
        () => _i15.SignInWithGoogle(gh<_i11.AuthRepository>()));
    gh.lazySingleton<_i16.SignOut>(
        () => _i16.SignOut(gh<_i11.AuthRepository>()));
    gh.factory<_i17.AuthBloc>(() => _i17.AuthBloc(
          gh<_i15.SignInWithGoogle>(),
          gh<_i16.SignOut>(),
          gh<_i14.GetCurrentUser>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i18.RegisterModule {}
