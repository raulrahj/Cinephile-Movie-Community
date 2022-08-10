// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as i1;
import 'package:injectable/injectable.dart' as i2;

import '../../../infrastructure/auth/authenticaton.dart' as i4;
import '../../../infrastructure/movie_info/movie_info.dart' as i7;
import '../../../logic/bloc/movie_info/movie_info_bloc.dart' as i8;
import '../../../logic/cubit/auth/authentication_cubit.dart' as i5;
import '../../repo/auth_repo.dart' as i3;
import '../../repo/movie_info_repo.dart'
    as i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
i1.GetIt $initGetIt(i1.GetIt get,
    {String? environment, i2.EnvironmentFilter? environmentFilter}) {
  final gh = i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<i3.AuthRepo>(() => i4.Authentication());
  gh.factory<i5.AuthenticationCubit>(
      () => i5.AuthenticationCubit(get<i3.AuthRepo>()));
  gh.lazySingleton<i6.MovieInfoRepo>(() => i7.MovieInfoRepository());
  gh.factory<i8.MovieInfoBloc>(
      () => i8.MovieInfoBloc(get<i6.MovieInfoRepo>()));
  return get;
}
