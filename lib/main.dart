import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_am/layout/news_app/news_layout.dart';
import 'package:news_am/shared/components/constants.dart';
import 'package:news_am/shared/network/remote/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,

      darkTheme: ThemeData(scaffoldBackgroundColor: Colors.blueGrey),
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kprimaryColor,
        ),
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: kprimaryColor,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: kprimaryColor,
            type: BottomNavigationBarType.fixed,
            elevation: 20),
      ),
      debugShowCheckedModeBanner: false,
      home: const Directionality(
          textDirection: TextDirection.ltr, child: NewsLayout()),
      //74c9b02fe05342c5b669c8069e1e3324
    );
  }
}
