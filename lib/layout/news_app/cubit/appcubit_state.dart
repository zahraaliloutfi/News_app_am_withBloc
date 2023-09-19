part of 'appcubit_cubit.dart';

@immutable
sealed class AppcubitState {}

final class AppcubitInitial extends AppcubitState {}

final class AppChangeState extends AppcubitState {}
