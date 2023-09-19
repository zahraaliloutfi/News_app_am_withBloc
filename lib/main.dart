import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_am/layout/news_app/cubit/appcubit_cubit.dart';
import 'package:news_am/layout/news_app/cubit/cubit_cubit.dart';
import 'package:news_am/layout/news_app/news_layout.dart';
import 'package:news_am/shared/components/constants.dart';
import 'package:news_am/shared/network/local/cash_helper.dart';
import 'package:news_am/shared/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CachHelper.init();
  bool? isDark = CachHelper.getBoolen(key: 'isDark');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppcubitState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          themeMode: BlocProvider.of<AppCubit>(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: ThemeData(
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            scaffoldBackgroundColor: darkKprimaryColor,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: kprimaryColor,
            ),
            primarySwatch: Colors.grey,
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: darkKprimaryColor,
                statusBarIconBrightness: Brightness.light,
              ),
              backgroundColor: darkKprimaryColor,
              elevation: 0.0,
              titleTextStyle: const TextStyle(
                color: kprimaryColorWhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              iconTheme: const IconThemeData(
                color: kprimaryColorWhite,
              ),
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: kprimaryColorWhite,
                unselectedItemColor: Colors.blueGrey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: darkKprimaryColor,
                elevation: 20),
          ),
          theme: ThemeData(
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: kprimaryColor,
            ),
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
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
          home: Directionality(
            textDirection: TextDirection.ltr,
            child: NewsLayout(),
          ),
          //74c9b02fe05342c5b669c8069e1e3324
        ),
      ),
    );
  }
}
