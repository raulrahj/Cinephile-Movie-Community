// import 'package:json_annotation/json_annotation.dart';

// // import 'result.dart';

// part 'm_trending.g.dart';

// @JsonSerializable()
// class Trending {
//   @JsonKey(name: 'page')
//   int? page = 1;
//   @JsonKey(name: 'results')
//   List<Result>? results;
//   @JsonKey(name: 'total_pages')
//   int? totalPages;
//   @JsonKey(name: 'total_results')
//   int? totalResults;

//   Trending({
//     this.page,
//     this.results = const [],
//      this.totalPages, this.totalResults
//   });

//   factory Trending.fromJson(Map<String, dynamic> json) =>
//       _$TrendingFromJson(json);

//   Map<String, dynamic> toJson() => _$TrendingToJson(this);
// }

// @JsonSerializable()
// class Result {
//   @JsonKey(name: 'vote_average')
//   double? voteAverage;

//   @JsonKey(name: 'overview')
//   String? overview;

//   @JsonKey(name: 'release_date')
//   String? releaseDate;

//   @JsonKey(name: 'title')
//   String? title;

//   @JsonKey(name: 'adult')
//   bool? adult;

//   @JsonKey(name: 'backdrop_path')
//   String? backdropPath;

//   @JsonKey(name: 'genre_ids')
//   List<int>? genreIds;

//   @JsonKey(name: 'vote_count')
//   int? voteCount;

//   @JsonKey(name: 'original_language')
//   String? originalLanguage;

//   @JsonKey(name: 'original_title')
//   String? originalTitle;

//   @JsonKey(name: 'poster_path')
//   String? posterPath;

//   @JsonKey(name: 'id')
//   int? id;

//   @JsonKey(name: 'popularity')
//   double? popularity;

//   @JsonKey(name: 'media_type')
//   String? mediaType;

//   Result({
//     this.voteAverage,
//     this.overview,
//     this.releaseDate,
//     this.title,
//     this.adult,
//     this.backdropPath,
//     this.genreIds,
//     this.voteCount,
//     this.originalLanguage,
//     this.originalTitle,
//     this.posterPath,
//     this.id,
//     this.popularity,
//     this.mediaType,
//   });

//   factory Result.fromJson(Map<String, dynamic> json) {
//     return _$ResultFromJson(json);
//   }

//   Map<String, dynamic> toJson() => _$ResultToJson(this);
// }
// To parse this JSON data, do
//
//     final trending = trendingFromJson(jsonString);

import 'dart:convert';

Trending trendingFromJson(String str) => Trending.fromJson(json.decode(str));

String trendingToJson(Trending data) => json.encode(data.toJson());

class Trending {
  Trending({
    this.page,
    this.results,
  });

  int? page=1;
  List<Result>? results;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    // this.mediaType,
    this.title,
    // this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    // this.originCountry,
    this.originalName,
    this.firstAirDate,
  });

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  // MediaType? mediaType;
  String? title;
  // OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? name;
  // List<String>? originCountry;
  String? originalName;
  DateTime? firstAirDate;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        // mediaType: mediaTypeValues.map![json["media_type"]],
        title: json["title"] == null ? null : json["title"],
        // originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        // releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"] == null ? null : json["name"],
        // originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        originalName:
            json["original_name"] == null ? null : json["original_name"],
        // firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        // "media_type": mediaTypeValues.reverse[mediaType],
        "title": title == null ? null : title,
        // "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video == null ? null : video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name == null ? null : name,
        // "origin_country": originCountry == null
            // ? null
            // : List<dynamic>.from(originCountry!.map((x) => x)),
        // "original_name": originalName == null ? null : originalName,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
      };
}

// enum MediaType { MOVIE, TV }

// final mediaTypeValues =
//     EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

// enum OriginalLanguage { EN, ES, DE, JA }

// final originalLanguageValues = EnumValues({
//   "de": OriginalLanguage.DE,
//   "en": OriginalLanguage.EN,
//   "es": OriginalLanguage.ES,
//   "ja": OriginalLanguage.JA
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
