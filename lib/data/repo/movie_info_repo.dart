import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:dartz/dartz.dart';

abstract class MovieInfoRepo {
  Future<Either<MainFailure, Trending>> getTrending();
  Future<Either<MainFailure, NewReleases>> getNewReleases();
}
