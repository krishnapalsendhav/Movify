import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/create_movie_model.dart';
import 'package:movie_app/models/delete_movie_model.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<AllMovies?> getMovies() async {
    try {
      var res = await http.get(Uri.parse('http://localhost:5000/api/v2/movies'));
      if (res.statusCode == 200) {
        return allMoviesFromJson(res.body);
      } else if (res.statusCode == 404) {
        Get.snackbar('404', res.body.toString());
      }
      return null;
    } catch (e) {
      Get.defaultDialog(content: Text('$e'));
    }
    return null;
  }

  Future<CreateMovie?> createMovie(String movieName, String imageUrl, List<String> downloadUrls) async {
    try {
      var res = await http.post(
        Uri.parse('https://movie-app-fbn6.onrender.com/api/v1/movies'),
        body: jsonEncode(
          <String, dynamic>{
            "title": movieName,
            "imageUrl": imageUrl,
            "downloadUrl": downloadUrls,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 201) {
        return createMovieFromJson(res.body);
      } else if (res.statusCode == 404) {
        Get.snackbar('404', res.body.toString());
      }
      return null;
    } catch (e) {
      Get.defaultDialog(content: Text('$e'));
      printError(info: e.toString());
    }
    return null;
  }

  Future<CreateMovie?> updateMovie(String movieID, String movieName, String imageUrl, List<String> downloadUrls) async {
    try {
      var res = await http.patch(
        Uri.parse('https://movie-app-fbn6.onrender.com/api/v1/movies/$movieID'),
        body: jsonEncode(
          <String, dynamic>{
            "title": movieName,
            "imageUrl": imageUrl,
            "downloadUrl": downloadUrls,
          },
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (res.statusCode == 200) {
        return createMovieFromJson(res.body);
      } else if (res.statusCode == 404) {
        Get.snackbar('404', res.body.toString());
      }
      return null;
    } catch (e) {
      Get.defaultDialog(content: Text('$e'));
      printError(info: e.toString());
    }
    return null;
  }

  Future<DeleteMovie?> deleteMovie(String movieID) async {
    try {
      var res = await http.delete(Uri.parse('https://movie-app-fbn6.onrender.com/api/v1/movies/$movieID'));
      if (res.statusCode == 200 || res.statusCode == 404) {
        return deleteMovieFromJson(res.body);
      } else {
        Get.snackbar(res.statusCode.toString(), res.body.toString());
      }
      return null;
    } catch (e) {
      Get.defaultDialog(content: Text('$e'));
    }
    return null;
  }
}
