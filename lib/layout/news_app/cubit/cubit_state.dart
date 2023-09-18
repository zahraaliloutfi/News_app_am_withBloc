part of 'cubit_cubit.dart';

abstract class NewsState {
  // get bottomItems => NewsCubit().bottomItems;
}

//as set state
final class NewsInitialState extends NewsState {}

final class NewsBottomNavState extends NewsState {}

final class NewsGetBusnessLoadingState extends NewsState {}

final class NewsGetBusnessSuccessState extends NewsState {}

final class NewsGetBusnessErrorState extends NewsState {
  final String error;
  NewsGetBusnessErrorState(this.error);
}

//-------------------
final class NewsGetScienceLoadingState extends NewsState {}

final class NewsGetScienceSuccessState extends NewsState {}

final class NewsGetScienceErrorState extends NewsState {
  final String error;
  NewsGetScienceErrorState(this.error);
}
//-----------

final class NewsGetSportsLoadingState extends NewsState {}

final class NewsGetSportsSuccessState extends NewsState {}

final class NewsGetSportsErrorState extends NewsState {
  final String error;
  NewsGetSportsErrorState(this.error);
}
