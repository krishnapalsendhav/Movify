import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/constants/constant_methods.dart';
import 'package:movie_app/controller/controller.dart';

class GetMovies extends StatelessWidget {
  GetMovies({super.key});
  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColorDark,
        foregroundColor: theme.primaryColorLight,
        leading: IconButton(onPressed: (() => Get.back()), icon: Icon(Icons.arrow_back_ios_rounded, color: theme.primaryColorLight)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        shadowColor: theme.shadowColor,
        title: Text('All Movies', style: theme.textTheme.titleLarge),
      ),
      body: Obx(
        () => controller.moviesList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Obx(
                () => ListView.builder(
                  itemCount: controller.moviesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        onTap: () => onTap(index, theme, context, width, height),
                        title: Text(controller.moviesList[index]!.title ?? 'Title unavailable'),
                        subtitle: Text(controller.moviesList[index]!.id ?? 'id unavailable'),
                        leading: SizedBox(
                          width: 50,
                          child: FadeInImage(
                            placeholder: const AssetImage('assets/images/play.png'),
                            image: controller.moviesList[index]!.imageUrl != null ? NetworkImage(controller.moviesList[index]!.imageUrl!) : const AssetImage('assets/images/play.png') as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                        trailing: SizedBox(
                          width: 55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.edit_rounded, color: Colors.grey),
                              GestureDetector(
                                onTap: () => onDelete(index, controller),
                                child: const Icon(Icons.delete_rounded, color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }

  void onTap(int index, ThemeData theme, BuildContext context, double width, double height) {
    final movieNameController = TextEditingController(text: controller.moviesList[index]!.title);
    final imageUrlController = TextEditingController(text: controller.moviesList[index]!.imageUrl);
    final downloadUrlController = TextEditingController(text: controller.moviesList[index]!.downloadUrl![0]!.url);
    showModalBottomSheet(
        backgroundColor: theme.scaffoldBackgroundColor,
        clipBehavior: Clip.antiAlias,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, modalSetState) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: height * 0.85,
              width: width,
              child: Column(
                children: [
                  SizedBox(height: height / 16),
                  Image.network(
                    controller.moviesList[index]!.imageUrl!,
                    height: height / 3,
                  ),
                  const SizedBox(height: 20),
                  SelectableText(controller.moviesList[index]!.title!, style: theme.textTheme.titleLarge),
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
                          controller: movieNameController,
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
                          controller: imageUrlController,
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
                          controller: downloadUrlController,
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
                        onPressed: () => onUpdate(controller, controller.moviesList[index]!.id!, movieNameController, imageUrlController, downloadUrlController),
                        child: Row(
                          children: [
                            Text('Update', style: theme.textTheme.titleSmall),
                            Icon(Icons.upload_rounded, color: theme.primaryColorLight),
                          ],
                        ),
                      ),
                      MaterialButton(
                        color: Colors.red,
                        disabledColor: Colors.grey,
                        clipBehavior: Clip.antiAlias,
                        onPressed: () => onDelete(index, controller),
                        child: Row(
                          children: [
                            Text('Delete', style: theme.textTheme.titleSmall),
                            Icon(Icons.delete_rounded, color: theme.primaryColorLight),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          });
        });
  }
}
