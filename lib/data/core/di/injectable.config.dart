// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../infrastructure/movie_info/movie_info.dart' as _i4;
import '../../../logic/bloc/movie_info/movie_info_bloc.dart' as _i5;
import '../../repo/trending_repo.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.MovieInfoRepo>(() => _i4.MovieInfoRepository());
  gh.factory<_i5.MovieInfoBloc>(
      () => _i5.MovieInfoBloc(get<_i3.MovieInfoRepo>()));
  return get;
}
