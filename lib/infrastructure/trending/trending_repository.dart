import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
// import 'package:open_box/config/st rings.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:open_box/data/repo/trending_repo.dart';

@LazySingleton(as: TrendingRepo)
class TrendingRepository implements TrendingRepo {
  @override
  Future<Either<MainFailure, List<Trending>>> getTrending() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.trending);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final trendingList =
            (response.data['page']['results'] as List).map((e) {
          return Trending.fromJson(e);
        }).toList();
        // log(trendingList.first.results![0].backdropPath.toString());
        return Right(trendingList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }
}
