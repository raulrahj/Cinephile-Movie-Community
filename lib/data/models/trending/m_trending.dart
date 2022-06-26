import 'package:json_annotation/json_annotation.dart';

// import 'result.dart';

part 'm_trending.g.dart';

@JsonSerializable()
class Trending {
  @JsonKey(name: 'page')
  int? page = 1;
  @JsonKey(name: 'results')
  List<Result>? results;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  Trending({
    this.page,
    this.results = const [],
     this.totalPages, this.totalResults
  });

  factory Trending.fromJson(Map<String, dynamic> json) =>
      _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'media_type')
  String? mediaType;

  Result({
    this.voteAverage,
    this.overview,
    this.releaseDate,
    this.title,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.id,
    this.popularity,
    this.mediaType,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
