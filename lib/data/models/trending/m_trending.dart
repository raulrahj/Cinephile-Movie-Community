
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
        title: json["title"],
        // originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle:
            json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        // releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
        name: json["name"],
        // originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
        originalName:
            json["original_name"],
        // firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        // "media_type": mediaTypeValues.reverse[mediaType],
        "title": title,
        // "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate == null
            ? null
            : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "name": name,
        // "origin_country": originCountry == null
            // ? null
            // : List<dynamic>.from(originCountry!.map((x) => x)),
        // "original_name": originalName == null ? null : originalName,
        "first_air_date": firstAirDate == null
            ? null
            : "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
      };
}
