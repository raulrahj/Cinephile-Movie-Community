// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../infrastructure/movie_info/movie_info.dart' as _i4;
import '../../../logic/bloc/trending/new_releases/new_releases_bloc.dart'
    as _i5;
import '../../../logic/bloc/trending/trending_bloc.dart' as _i6;
import '../../repo/trending_repo.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.NewReleasesRepo>(() => _i4.NewReleasesRepository());
  gh.lazySingleton<_i3.TrendingRepo>(() => _i4.TrendingRepository());
  gh.factory<_i5.NewReleasesBloc>(
      () => _i5.NewReleasesBloc(get<_i3.NewReleasesRepo>()));
  gh.factory<_i6.TrendingBloc>(() => _i6.TrendingBloc(get<_i3.TrendingRepo>()));
  return get;
}
