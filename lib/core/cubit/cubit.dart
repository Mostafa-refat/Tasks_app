import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/cacheHelper/cache_helper.dart';
import 'package:tasks/core/cubit/states.dart';

class ModeCubit extends Cubit<AppStates> {
  ModeCubit() : super(AppInitialState());

  static ModeCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void changeNewsAppMode({bool? fromShared}){
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value){
        emit(AppChangeModeState());
      });
    }
  }
}