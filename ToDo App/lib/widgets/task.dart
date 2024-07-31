import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bloc/checkbox_cubit.dart';
import 'package:todo/bloc/bloc/db_bloc.dart';
import 'package:todo/bloc/states/checkbox_state.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/tasks_data.dart';
import 'package:todo/data/local/sqflite.dart';
import 'package:todo/screens/details.dart';

class TaskBox extends StatelessWidget {
  final String title;
  final String description;
  final String checked;
  final int color;
  final int id;
  final int index;
  TaskBox(
      {super.key,
      required this.title,
      required this.description,
      required this.checked,
      required this.color,
      required this.id,
      required this.index});

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Map<int, bool> isChecked = (checked == 'true') ? {id: true} : {id: false};
    Color bgColor = Color(color);
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            index: index,
          ),
        ),
      ),
      child: Stack(
        children: [
          BlocConsumer<CheckboxCubit, CheckboxStates>(
            listener: (context, state) {
              isChecked[id] = state.checked[id] ?? false;
             // bgColor = (isChecked[id] ?? false) ? Colors.grey : Color(color);
            },
            builder: (context, state) {
              return Container(
                width: 400,
                height: 180,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Container(
                    //   width: 40,
                    //   // height: 40,
                    //   child: Checkbox(
                    //     side: BorderSide(color: AppColors.white),
                    //     activeColor: Colors.green,
                    //     onChanged: (value) {
                    //       BlocProvider.of<CheckboxCubit>(context)
                    //           .toggle(isChecked[id] ?? true, id);
                    //     },
                    //     value: isChecked[id],
                    //   ),
                    // ),
                    // SizedBox(
                    //     // height: 100,
                    //     width: 1,
                    //     child: Container(
                    //       width: 2,
                    //       height: 150,
                    //       color: AppColors.offWhite,
                    //     )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Text(
                                description,
                                maxLines: 2,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
              left: 350,
              child: IconButton(
                onPressed: () async {
                  await BlocProvider.of<DbCubit>(context).deleteData('''
                            DELETE FROM  "tasks" WHERE id= "${id}"
                            ''');
                  print(tasksData);
                },
                icon: Icon(
                  Icons.delete,
                  color: AppColors.white,
                ),
              )),
        ],
      ),
    );
  }
}
