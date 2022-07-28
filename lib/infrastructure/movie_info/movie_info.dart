import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
// import 'package:open_box/config/st rings.dart';
import 'package:open_box/data/core/api_end_points.dart';
import 'package:open_box/data/models/new_releases/new_releases.dart';
import 'package:open_box/data/models/search/m_review.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:open_box/data/repo/movie_info_repo.dart';

@LazySingleton(as: MovieInfoRepo)
class MovieInfoRepository implements MovieInfoRepo {
  @override
  Future<Either<MainFailure, Trending>> getTrending() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.trending);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonEncode(response.data);
        final list = trendingFromJson(data);

        return Right(list);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewReleases>> getNewReleases() async {
    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.newReleases);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final newReleasesList = NewReleases.fromJson(response.data);

        return Right(newReleasesList);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (_) {
      return const Left(MainFailure.clientFailure());
    }
  }

}
