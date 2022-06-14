class Trending {
  // int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;

  Trending({ this.results, this.totalPages, this.totalResults});

  Trending.fromJson(Map<String, dynamic> json) {
    // page = json['page'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Results {
  List<int>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  int? id;
  bool? video;
  double? voteAverage;
  String? overview;
  String? releaseDate;
  int? voteCount;
  String? title;
  bool? adult;
  String? backdropPath;
  String? posterPath;
  double? popularity;
  String? mediaType;
  String? originalName;
  List<String>? originCountry;
  String? firstAirDate;
  String? name;

  Results(
      {this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.id,
      this.video,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.voteCount,
      this.title,
      this.adult,
      this.backdropPath,
      this.posterPath,
      this.popularity,
      this.mediaType,
      this.originalName,
      this.originCountry,
      this.firstAirDate,
      this.name});

  Results.fromJson(Map<String, dynamic> json) {
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    title = json['title'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    posterPath = json['poster_path'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
    originalName = json['original_name'];
    originCountry = json['origin_country'].cast<String>();
    firstAirDate = json['first_air_date'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genre_ids'] = genreIds;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['id'] = id;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['vote_count'] = voteCount;
    data['title'] = title;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['poster_path'] = posterPath;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    data['original_name'] = originalName;
    data['origin_country'] = originCountry;
    data['first_air_date'] = firstAirDate;
    data['name'] = name;
    return data;
  }
}

