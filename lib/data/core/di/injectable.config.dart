// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../infrastructure/auth/authenticaton.dart' as _i4;
import '../../../infrastructure/movie_info/movie_info.dart' as _i7;
import '../../../logic/bloc/movie_info/movie_info_bloc.dart' as _i8;
import '../../../logic/cubit/auth/authentication_cubit.dart' as _i5;
import '../../repo/auth_repo.dart' as _i3;
import '../../repo/movie_info_repo.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.AuthRepo>(() => _i4.Authentication());
  gh.factory<_i5.AuthenticationCubit>(
      () => _i5.AuthenticationCubit(get<_i3.AuthRepo>()));
  gh.lazySingleton<_i6.MovieInfoRepo>(() => _i7.MovieInfoRepository());
  gh.factory<_i8.MovieInfoBloc>(
      () => _i8.MovieInfoBloc(get<_i6.MovieInfoRepo>()));
  return get;
}
