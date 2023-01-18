// To parse this JSON data, do
//
//     final allMovies = allMoviesFromJson(jsonString);

import 'dart:convert';

AllMovies? allMoviesFromJson(String str) => AllMovies.fromJson(json.decode(str));

String allMoviesToJson(AllMovies? data) => json.encode(data!.toJson());

class AllMovies {
  AllMovies({
    this.responseCode,
    this.status,
    this.responseMsg,
    this.totalMovies,
    this.movies,
  });

  int? responseCode;
  String? status;
  String? responseMsg;
  int? totalMovies;
  List<Movie?>? movies;

  factory AllMovies.fromJson(Map<String, dynamic> json) => AllMovies(
        responseCode: json["responseCode"],
        status: json["status"],
        responseMsg: json["responseMsg"],
        totalMovies: json["totalMovies"],
        movies: json["movies"] == null ? [] : List<Movie?>.from(json["movies"]!.map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "status": status,
        "responseMsg": responseMsg,
        "totalMovies": totalMovies,
        "movies": movies == null ? [] : List<dynamic>.from(movies!.map((x) => x!.toJson())),
      };
}

class Movie {
  Movie({
    this.id,
    this.title,
    this.imageUrl,
    this.year,
    this.imdbRate,
    this.downloadUrl,
    this.trailerUrl,
    this.castAndCrew,
    this.description,
    this.v,
  });

  String? id;
  String? title;
  String? imageUrl;
  String? year;
  double? imdbRate;
  List<DownloadUrl?>? downloadUrl;
  String? trailerUrl;
  List<CastAndCrew?>? castAndCrew;
  String? description;
  int? v;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        year: json["year"],
        imdbRate: json["imdbRate"],
        downloadUrl: json["downloadUrl"] == null ? [] : List<DownloadUrl?>.from(json["downloadUrl"]!.map((x) => DownloadUrl.fromJson(x))),
        trailerUrl: json["trailerUrl"],
        castAndCrew: json["castAndCrew"] == null ? [] : List<CastAndCrew?>.from(json["castAndCrew"]!.map((x) => CastAndCrew.fromJson(x))),
        description: json["description"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "imageUrl": imageUrl,
        "year": year,
        "imdbRate": imdbRate,
        "downloadUrl": downloadUrl == null ? [] : List<dynamic>.from(downloadUrl!.map((x) => x!.toJson())),
        "trailerUrl": trailerUrl,
        "castAndCrew": castAndCrew == null ? [] : List<dynamic>.from(castAndCrew!.map((x) => x!.toJson())),
        "description": description,
        "__v": v,
      };
}

class CastAndCrew {
  CastAndCrew({
    this.imageUrl,
    this.name,
    this.id,
  });

  String? imageUrl;
  String? name;
  String? id;

  factory CastAndCrew.fromJson(Map<String, dynamic> json) => CastAndCrew(
        imageUrl: json["imageUrl"],
        name: json["name"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
        "_id": id,
      };
}

class DownloadUrl {
  DownloadUrl({
    this.title,
    this.size,
    this.url,
    this.id,
  });

  String? title;
  String? size;
  String? url;
  String? id;

  factory DownloadUrl.fromJson(Map<String, dynamic> json) => DownloadUrl(
        title: json["title"],
        size: json["size"],
        url: json["url"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "size": size,
        "url": url,
        "_id": id,
      };
}
