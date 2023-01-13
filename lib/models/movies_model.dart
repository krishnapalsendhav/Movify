// To parse this JSON data, do
//
//     final allMovies = allMoviesFromJson(jsonString);

import 'dart:convert';

AllMovies allMoviesFromJson(String str) => AllMovies.fromJson(json.decode(str));

String allMoviesToJson(AllMovies data) => json.encode(data.toJson());

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
  List<Movie>? movies;

  factory AllMovies.fromJson(Map<String, dynamic> json) => AllMovies(
        responseCode: json["responseCode"],
        status: json["status"],
        responseMsg: json["responseMsg"],
        totalMovies: json["totalMovies"],
        movies: json["movies"] == null ? null : List<Movie>.from(json["movies"].map((x) => Movie.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "status": status,
        "responseMsg": responseMsg,
        "totalMovies": totalMovies,
        "movies": movies == null ? null : List<dynamic>.from(movies!.map((x) => x.toJson())),
      };
}

class Movie {
  Movie({
    this.id,
    this.title,
    this.imageUrl,
    this.downloadUrl,
    this.v,
  });

  String? id;
  String? title;
  String? imageUrl;
  List<String>? downloadUrl;
  int? v;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["_id"],
        title: json["title"],
        imageUrl: json["imageUrl"],
        downloadUrl: json["downloadUrl"] == null ? null : List<String>.from(json["downloadUrl"].map((x) => x)),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "imageUrl": imageUrl,
        "downloadUrl": downloadUrl == null ? null : List<dynamic>.from(downloadUrl!.map((x) => x)),
        "__v": v,
      };
}
