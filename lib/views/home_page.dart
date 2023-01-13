import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/controller.dart';
import 'package:movie_app/views/movie_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          foregroundColor: theme.primaryColorLight,
          centerTitle: true,
          shadowColor: theme.shadowColor,
          title: Text('All Movies', style: theme.textTheme.titleLarge),
        ),
        body: Obx(() => controller.moviesList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Obx(
                () => GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: height / 2.8,
                  ),
                  itemCount: controller.moviesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () async => Get.to(() => MoviePage(movieIndex: index), transition: Transition.cupertino),
                      child: Card(
                        color: theme.primaryColorDark,
                        shadowColor: theme.shadowColor,
                        clipBehavior: Clip.antiAlias,
                        borderOnForeground: false,
                        elevation: 2,
                        child: FadeInImage(
                          placeholder: const AssetImage('assets/images/play.png'),
                          image: NetworkImage('${controller.moviesList[index].imageUrl}'),
                          fit: BoxFit.cover,
                          height: height / 3,
                        ),
                      ),
                    );
                  },
                ),
              )));
  }
}
