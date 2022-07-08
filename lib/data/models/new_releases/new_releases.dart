// class NewReleases {
//   Dates? dates;
//   int? page;
//   List<NewReleaseResults>? results;
//   int? totalPages;
//   int? totalResults;

//   NewReleases(
//       {this.dates ,
//       this.page =1,
//         this.results = const [],
//       this.totalPages,
//       this.totalResults});

//   NewReleases.fromJson(Map<String, dynamic> json) {
//     dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
//     page = json['page'];
//     if (json['results'] != null) {
//       results = <NewReleaseResults>[];
//       json['results'].forEach((v) {
//         results!.add(NewReleaseResults.fromJson(v));
//       });
//     }
//     totalPages = json['total_pages'];
//     totalResults = json['total_results'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (dates != null) {
//       data['dates'] = dates!.toJson();
//     }
//     data['page'] = page;
//     if (results != null) {
//       data['results'] = results!.map((v) => v.toJson()).toList();
//     }
//     data['total_pages'] = totalPages;
//     data['total_results'] = totalResults;
//     return data;
//   }
// }

// class Dates {
//   String? maximum;
//   String? minimum;

//   Dates({this.maximum, this.minimum});

//   Dates.fromJson(Map<String, dynamic> json) {
//     maximum = json['maximum'];
//     minimum = json['minimum'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['maximum'] = maximum;
//     data['minimum'] = minimum;
//     return data;
//   }
// }

// class NewReleaseResults {
//   bool? adult;
//   String? backdropPath;
//   List<int>? genreIds;
//   int? id;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   double? voteAverage;
//   int? voteCount;

//   NewReleaseResults(
//       {this.adult,
//       this.backdropPath,
//       // this.genreIds,
//       this.id,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.releaseDate,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount});

//   NewReleaseResults.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     // genreIds = json['genre_ids'].cast<int>();
//     id = json['id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['adult'] = adult;
//     data['backdrop_path'] = backdropPath;
//     data['genre_ids'] = genreIds;
//     data['id'] = id;
//     data['original_language'] = originalLanguage;
//     data['original_title'] = originalTitle;
//     data['overview'] = overview;
//     data['popularity'] = popularity;
//     data['poster_path'] = posterPath;
//     data['release_date'] = releaseDate;
//     data['title'] = title;
//     data['video'] = video;
//     data['vote_average'] = voteAverage;
//     data['vote_count'] = voteCount;
//     return data;
//   }
// }
// To parse this JSON data, do
//
//     final newReleases = newReleasesFromJson(jsonString);

import 'dart:convert';

NewReleases newReleasesFromJson(String str) => NewReleases.fromJson(json.decode(str));

String newReleasesToJson(NewReleases data) => json.encode(data.toJson());

class NewReleases {
    NewReleases({
        // this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    // Dates? dates;
    int? page;
    List<NewReleaseResults> ?results;
    int ?totalPages;
    int? totalResults;

    factory NewReleases.fromJson(Map<String, dynamic> json) => NewReleases(
        // dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<NewReleaseResults>.from(json["results"].map((x) => NewReleaseResults.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        // "dates": dates.toJson(),
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

// class Dates {
//     Dates({
//         this.maximum,
//         this.minimum,
//     });

//     DateTime maximum;
//     DateTime minimum;

//     factory Dates.fromJson(Map<String, dynamic> json) => Dates(
//         maximum: DateTime.parse(json["maximum"]),
//         minimum: DateTime.parse(json["minimum"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
//         "minimum": "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
//     };
// }

class NewReleaseResults {
    NewReleaseResults({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        // this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool? adult;
    String ?backdropPath;
    List<int> ?genreIds;
    int ?id;
    // OriginalLanguage originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String ?posterPath;
    DateTime? releaseDate;
    String? title;
    bool? video;
    double ?voteAverage;
    int? voteCount;

    factory NewReleaseResults.fromJson(Map<String, dynamic> json) => NewReleaseResults(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        // originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        // "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        // "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        // "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

// enum OriginalLanguage { EN, JA, FR }

// final originalLanguageValues = EnumValues({
//     "en": OriginalLanguage.EN,
//     "fr": OriginalLanguage.FR,
//     "ja": OriginalLanguage.JA
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
