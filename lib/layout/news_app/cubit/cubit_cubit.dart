import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_am/modules/busness/busness_screen.dart';
import 'package:news_am/modules/science/science_screen.dart';
import 'package:news_am/modules/sports/sports_screen.dart';
import '../../../modules/settings/settings_screen.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/remote/dio_helper.dart';
part 'cubit_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  // static NewsState get(context) => BlocProvider.of(context);
  int curruntIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Busness',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    BusnessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    const SettingsScreen()
  ];
  void changeBottomNav(index) {
    curruntIndex = index;
    if (index == 1)
      getSports();
    else if (index == 2) getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic> busness = [];
  void getBusness() {
    emit(NewsGetBusnessLoadingState());
    DioHelper.getData(
      url: methodUrl,
      query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '74c9b02fe05342c5b669c8069e1e3324',
      },
    ).then((value) {
      // print(
      //   value.data['articles'][0]['title'],
      // );
      busness = value.data['articles'];
      print(
        busness[0]['title'],
      );
      emit(NewsGetBusnessSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(NewsGetBusnessErrorState(e.toString()));
    });
  }

//----------------
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: methodUrl,
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': '74c9b02fe05342c5b669c8069e1e3324',
        },
      ).then((value) {
        // print(
        //   value.data['articles'][0]['title'],
        // );
        sports = value.data['articles'];
        print(
          sports[0]['title'],
        );
        emit(NewsGetSportsSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsGetSportsErrorState(e.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

//----------
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: methodUrl,
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': '74c9b02fe05342c5b669c8069e1e3324',
        },
      ).then((value) {
        // print(
        //   value.data['articles'][0]['title'],
        // );
        science = value.data['articles'];
        print(
          science[0]['title'],
        );
        emit(NewsGetScienceSuccessState());
      }).catchError((e) {
        print(e.toString());
        emit(NewsGetScienceErrorState(e.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }
}
