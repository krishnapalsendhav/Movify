// To parse this JSON data, do
//
//     final createMovie = createMovieFromJson(jsonString);

import 'dart:convert';

CreateMovie? createMovieFromJson(String str) => CreateMovie.fromJson(json.decode(str));

String createMovieToJson(CreateMovie? data) => json.encode(data!.toJson());

class CreateMovie {
  CreateMovie({
    this.responseCode,
    this.status,
    this.responseMsg,
    this.movie,
  });

  int? responseCode;
  String? status;
  String? responseMsg;
  Movie? movie;

  factory CreateMovie.fromJson(Map<String, dynamic> json) => CreateMovie(
        responseCode: json["responseCode"],
        status: json["status"],
        responseMsg: json["responseMsg"],
        movie: Movie.fromJson(json["movie"]),
      );

  Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "status": status,
        "responseMsg": responseMsg,
        "movie": movie!.toJson(),
      };
}

class Movie {
  Movie({
    this.title,
    this.imageUrl,
    this.downloadUrl,
    this.id,
    this.v,
  });

  String? title;
  String? imageUrl;
  List<String?>? downloadUrl;
  String? id;
  int? v;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        title: json["title"],
        imageUrl: json["imageUrl"],
        downloadUrl: json["downloadUrl"] == null ? [] : List<String?>.from(json["downloadUrl"]!.map((x) => x)),
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "imageUrl": imageUrl,
        "downloadUrl": downloadUrl == null ? [] : List<dynamic>.from(downloadUrl!.map((x) => x)),
        "_id": id,
        "__v": v,
      };
}
