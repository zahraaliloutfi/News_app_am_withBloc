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
  runApp(MyApp(
    isDark: isDark!,
  ));
}

class MyApp extends StatelessWidget {
  // Create a MaterialColor from the primary color
  static MaterialColor kPrimarySwatch = MaterialColor(
    0xFF2196F3,
    <int, Color>{
      50: const Color(0xFFE3F2FD),
      100: const Color(0xFFBBDEFB),
      200: const Color(0xFF90CAF9),
      300: const Color(0xFF64B5F6),
      400: const Color(0xFF42A5F5),
      500: kprimaryColor, // Your primary color
      600: const Color(0xFF1E88E5),
      700: const Color(0xFF1976D2),
      800: const Color(0xFF1565C0),
      900: const Color(0xFF0D47A1),
    },
  );
  MyApp({super.key, this.isDark});
  bool? isDark;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<AppCubit, AppcubitState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          themeMode: BlocProvider.of<AppCubit>(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          darkTheme: ThemeData(
            dividerTheme: DividerThemeData(
              endIndent: 20,
              indent: 20,
              thickness: 1,
            ),
            dividerColor: Colors.white,
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
            dividerColor: Colors.lightGreen,
            dividerTheme: DividerThemeData(
              endIndent: 20,
              indent: 20,
              thickness: 1,
            ),
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
            primarySwatch: kPrimarySwatch,
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
