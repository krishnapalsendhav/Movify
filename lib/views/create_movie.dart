import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constants/constant_methods.dart';
import 'package:movie_app/views/all_movie_page.dart';
import 'package:movie_app/views/home_page.dart';

class UploadMoviePage extends StatelessWidget {
  UploadMoviePage({super.key});
  final _movieNameController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _downloadUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColorDark,
        foregroundColor: theme.primaryColorLight,
        centerTitle: true,
        shadowColor: theme.shadowColor,
        title: Text('Upload Movies', style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              elevation: 3,
              color: theme.primaryColorDark,
              shadowColor: theme.shadowColor,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 55,
                child: Center(
                  child: TextFormField(
                    controller: _movieNameController,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Movie Name',
                      hintStyle: TextStyle(color: theme.primaryColorLight),
                      prefixIcon: Icon(Icons.title_rounded, color: theme.primaryColorLight),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 3,
              color: theme.primaryColorDark,
              shadowColor: theme.shadowColor,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 55,
                child: Center(
                  child: TextFormField(
                    controller: _imageUrlController,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Image Url',
                      hintStyle: TextStyle(color: theme.primaryColorLight),
                      prefixIcon: Icon(Icons.image_rounded, color: theme.primaryColorLight),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Material(
              elevation: 3,
              color: theme.primaryColorDark,
              shadowColor: theme.shadowColor,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 55,
                child: Center(
                  child: TextFormField(
                    controller: _downloadUrlController,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter Download Url',
                      hintStyle: TextStyle(color: theme.primaryColorLight),
                      prefixIcon: Icon(Icons.download_rounded, color: theme.primaryColorLight),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  color: Colors.green,
                  disabledColor: Colors.grey,
                  clipBehavior: Clip.antiAlias,
                  onPressed: () => onUpload(_movieNameController, _imageUrlController, _downloadUrlController),
                  child: Row(
                    children: [
                      Text('Upload', style: theme.textTheme.titleSmall),
                      Icon(Icons.upload_rounded, color: theme.primaryColorLight),
                    ],
                  ),
                ),
                MaterialButton(
                  color: theme.primaryColor,
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                    Get.to(() => GetMovies(), transition: Transition.cupertino);
                  },
                  child: Row(
                    children: [
                      Text('Get Movies', style: theme.textTheme.titleSmall),
                      Icon(Icons.movie_filter_rounded, color: theme.primaryColorLight),
                    ],
                  ),
                ),
                MaterialButton(
                  color: theme.primaryColor,
                  clipBehavior: Clip.antiAlias,
                  onPressed: () {
                    Get.to(() => HomePage(), transition: Transition.cupertino);
                  },
                  child: Row(
                    children: [
                      Text('Home', style: theme.textTheme.titleSmall),
                      Icon(Icons.home_rounded, color: theme.primaryColorLight),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
