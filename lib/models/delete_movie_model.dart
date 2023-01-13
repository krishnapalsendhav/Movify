// To parse this JSON data, do
//
//     final deleteMovie = deleteMovieFromJson(jsonString);

import 'dart:convert';

DeleteMovie? deleteMovieFromJson(String str) => DeleteMovie.fromJson(json.decode(str));

String deleteMovieToJson(DeleteMovie? data) => json.encode(data!.toJson());

class DeleteMovie {
    DeleteMovie({
        this.responseCode,
        this.status,
        this.responseMsg,
    });

    int? responseCode;
    String? status;
    String? responseMsg;

    factory DeleteMovie.fromJson(Map<String, dynamic> json) => DeleteMovie(
        responseCode: json["responseCode"],
        status: json["status"],
        responseMsg: json["responseMsg"],
    );

    Map<String, dynamic> toJson() => {
        "responseCode": responseCode,
        "status": status,
        "responseMsg": responseMsg,
    };
}
