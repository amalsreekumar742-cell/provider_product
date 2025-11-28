// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/auth/repo/auth_repo.dart' as _i844;
import '../../../features/auth/repo/i_auth_impl.dart' as _i155;
import '../../../features/products/repo/i_product_impl.dart' as _i641;
import '../../../features/products/repo/product_repo.dart' as _i803;
import 'firebase_injectable_module.dart' as _i574;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  await gh.factoryAsync<_i574.FirebaseService>(
    () => firebaseInjectableModule.firebaseService,
    preResolve: true,
  );
  gh.lazySingleton<_i974.FirebaseFirestore>(
    () => firebaseInjectableModule.firestore,
  );
  gh.lazySingleton<_i59.FirebaseAuth>(
    () => firebaseInjectableModule.firebaseAuth,
  );
  gh.lazySingleton<_i803.ProductRepoImpl>(
    () => _i641.IProductImpl(gh<_i974.FirebaseFirestore>()),
  );
  gh.lazySingleton<_i844.AuthRepo>(
    () =>
        _i155.IAuthImpl(gh<_i59.FirebaseAuth>(), gh<_i974.FirebaseFirestore>()),
  );
  return getIt;
}

class _$FirebaseInjectableModule extends _i574.FirebaseInjectableModule {}
