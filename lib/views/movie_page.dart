import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MoviePage extends StatelessWidget {
  final int movieIndex;
  MoviePage({super.key, required this.movieIndex});
  final MyController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColorDark,
        foregroundColor: theme.primaryColorLight,
        leading: IconButton(onPressed: (() => Get.back()), icon: Icon(Icons.arrow_back_ios_rounded, color: theme.primaryColorLight)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        shadowColor: theme.shadowColor,
        title: Text('${controller.moviesList[movieIndex]!.title}', style: theme.textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: width,
                height: height / 1.5,
                child: Image.network(controller.moviesList[movieIndex]!.imageUrl!, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    color: Colors.red,
                    clipBehavior: Clip.antiAlias,
                    onPressed: () async => _urlLaunch('https://youtu.be/jVPyBCrapoI'),
                    child: Row(
                      children: [Text('Trailer', style: theme.textTheme.titleMedium), Icon(Icons.play_arrow_rounded, color: theme.primaryColorLight)],
                    ),
                  ),
                  MaterialButton(
                    color: Colors.green,
                    clipBehavior: Clip.antiAlias,
                    onPressed: () async => _urlLaunch(controller.moviesList[movieIndex]!.downloadUrl![0]!.url!),
                    child: Row(
                      children: [Text('Download', style: theme.textTheme.titleMedium), Icon(Icons.download_rounded, color: theme.primaryColorLight)],
                    ),
                  ),
                ],
              ),
              Text('Cast & Crew', style: theme.textTheme.titleMedium),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 90,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            // width: 90,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/images/play.png'),
                              foregroundImage: NetworkImage('https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                            ),
                          ),
                          Text(
                            'Person Photos',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelSmall,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text('Description', style: theme.textTheme.titleMedium),
              Divider(color: theme.primaryColorLight),
              Text(
                'Aute enim aliqua laborum dolore. Cupidatat id qui mollit occaecat quis sint irure consectetur consequat. Qui amet officia adipisicing fugiat officia id. Esse magna id qui enim consectetur est nulla pariatur ex pariatur et exercitation excepteur veniam.',
                style: theme.textTheme.labelSmall,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _urlLaunch(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Something went Wrong');
    }
  }
}
