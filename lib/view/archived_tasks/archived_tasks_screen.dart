import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/core/components/components.dart';
import 'package:tasks/home_layout/cubit/cubit.dart';
import 'package:tasks/home_layout/cubit/states.dart';

class ArchivedTaskScreen extends StatelessWidget {
  const ArchivedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return ListView.separated(
          itemBuilder: (context, index) => buildTaskItem(tasks![index], context),
          separatorBuilder: (context, index) =>
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: tasks!.length,
        );
      },
    );

  }
}
