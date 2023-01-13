import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/views/create_movie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movies',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue.shade400,
        scaffoldBackgroundColor: const Color.fromRGBO(30, 32, 38, 1),
        primaryColorLight: Colors.white,
        primaryColorDark: const Color.fromRGBO(41, 46, 60, 1),
        shadowColor: const Color.fromRGBO(18, 18, 18, 0.5),
        primaryTextTheme: const TextTheme(),
        textTheme: GoogleFonts.poppinsTextTheme(
          TextTheme(
            bodySmall: const TextStyle(
              color: Colors.white,
            ),
            headlineMedium: const TextStyle(
              color: Colors.deepOrange,
            ),
            titleLarge: const TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
            titleMedium: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            titleSmall: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade100,
            ),
            labelSmall: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade100,
            ),
          ),
        ),
      ),
      home: UploadMoviePage(),
    );
  }
}
