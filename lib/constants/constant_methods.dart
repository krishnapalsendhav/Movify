import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/controller/controller.dart';

import '../services/internet_services.dart';

onUpload(TextEditingController movieNameController, TextEditingController imageUrlController, TextEditingController downloadUrlController) async {
  var res = await Services().createMovie(movieNameController.text, imageUrlController.text, [downloadUrlController.text]);

  if (res != null) {
    Get.snackbar(res.status!, res.responseMsg!, backgroundColor: Colors.green, snackPosition: SnackPosition.TOP);
    HapticFeedback.lightImpact();
    if (res.status == 'success') {
      movieNameController.clear();
      imageUrlController.clear();
      downloadUrlController.clear();
    }
  }
}

onUpdate(MyController controller, String movieID, TextEditingController movieNameController, TextEditingController imageUrlController, TextEditingController downloadUrlController) async {
  var res = await Services().updateMovie(movieID, movieNameController.text, imageUrlController.text, [downloadUrlController.text]);

  if (res != null) {
    showSuccessfulDialog(res.responseMsg!, controller);
    Get.snackbar(res.status!, res.responseMsg!, backgroundColor: Colors.green, snackPosition: SnackPosition.TOP);
    HapticFeedback.lightImpact();

    if (res.status == 'success') {
      Get.back();
    }
  }
}

onDelete(int index, MyController controller) async {
  Get.defaultDialog(
    title: '',
    titlePadding: const EdgeInsets.all(0),
    backgroundColor: Get.theme.primaryColorDark,
    content: Text('Once you delete it, there is no going back.', style: Get.textTheme.titleSmall),
    confirmTextColor: Get.theme.primaryColorLight,
    onCancel: () {},
    onConfirm: () async {
      var res = await Services().deleteMovie(controller.moviesList[index]!.id!);

      if (res != null) {
        Get.back();
        showSuccessfulDialog(res.responseMsg!, controller);
        HapticFeedback.lightImpact();
        controller.moviesList.clear();
        controller.fetchMovies();
      }
    },
  );
}

showSuccessfulDialog(String suceesMsg, MyController controller) => Get.defaultDialog(
      title: '',
      titlePadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            "assets/animations/order_confirmed.json",
            repeat: false,
            height: 200,
            width: 200,
            controller: controller.lottieController,
            onLoaded: (composition) {
              controller.lottieController.duration = composition.duration;
              controller.lottieController.forward();
            },
          ),
          Center(
            child: Text(
              suceesMsg,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 21),
        ],
      ),
    );
