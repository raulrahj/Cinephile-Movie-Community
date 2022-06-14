import 'package:open_box/data/core/failures/main_failure.dart';
import 'package:open_box/data/models/trending/m_trending.dart';
import 'package:dartz/dartz.dart';

abstract class TrendingRepo{
  Future<Either<MainFailure,List<Trending>>> getTrending();
}