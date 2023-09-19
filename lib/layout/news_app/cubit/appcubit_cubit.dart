import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_am/shared/network/local/cash_helper.dart';

part 'appcubit_state.dart';

class AppCubit extends Cubit<AppcubitState> {
  AppCubit() : super(AppcubitInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null)
      isDark = fromShared;
    else
      isDark = !isDark;
    CachHelper.putBoolen(key: 'isDark', value: isDark).then(
      (value) => emit(AppChangeState()),
    );
  }
}
