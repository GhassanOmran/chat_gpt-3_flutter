import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/features/about/binding.dart';
import 'core/constants/colors.dart';
import 'features/codex/binding.dart';
import 'features/codex/index.dart';
import 'features/home/binding.dart';
import 'features/home/index.dart';
import 'features/image_generator/binding.dart';
import 'features/image_generator/index.dart';
import 'features/about/index.dart';
import 'features/splash/index.dart';
import 'features/text/binding.dart';
import 'features/text/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: SplashGPTPageBinding(),
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashGPTPage(),
        ),
        GetPage(
            name: '/home',
            page: () => const HomeGPTPage(),
            binding: HomeGPTPageBinding()),
        GetPage(
            name: '/text',
            page: () => const TextGPTPage(),
            binding: TextGPTPageBinding()),
        GetPage(
            name: '/codex',
            page: () => const CodexGPTPage(),
            binding: CodexGPTPageBinding()),
        GetPage(
            name: '/imageGenerator',
            page: () => const ImageGeneratorPage(),
            binding: ImageGeneratorPageBinding()),
        GetPage(
            name: '/about',
            page: () => AboutPage(),
            binding: AboutPageBinding()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Chat GPT',
      theme: ThemeData(
        primaryColor: backgroundColor,
        fontFamily: 'Raleway',
        appBarTheme: const AppBarTheme(
            backgroundColor: botBackgroundColor,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            )),
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white)),
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const SplashGPTPage(),
    );
  }
}
