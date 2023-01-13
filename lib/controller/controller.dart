import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/services/internet_services.dart';

class MyController extends GetxController with GetSingleTickerProviderStateMixin {
  Services services = Services();
  RxList<Movie> moviesList = <Movie>[].obs;
  late AnimationController lottieController;

  void fetchMovies() async {
    var res = await services.getMovies();
    if (res != null) {
      moviesList.addAll(res.movies!);
      moviesList.refresh();
    }
    update();
  }

  void initializeAnimation() {
    lottieController = AnimationController(
      vsync: this,
    );
    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Get.back();
        lottieController.reset();
      }
    });
  }

  @override
  void onInit() {
    fetchMovies();
    initializeAnimation();
    super.onInit();
  }
}
