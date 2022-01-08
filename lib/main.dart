import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/cacheHelper/cache_helper.dart';
import 'package:tasks/core/cubit/cubit.dart';
import 'package:tasks/core/cubit/states.dart';
import 'package:tasks/home_layout/home_screen.dart';
import 'core/blocObserver/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');


  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({this.isDark});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      ModeCubit()
        ..changeNewsAppMode(fromShared: isDark),
      child: BlocConsumer<ModeCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ModeCubit.get(context).isDark ?
            ThemeData.dark() :
            ThemeData.light(),
            home: MyHomeScreen(),
          );
        },
      ),
    );
  }
}
