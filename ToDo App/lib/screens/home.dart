import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bloc/db_bloc.dart';
import 'package:todo/bloc/states/db_states.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/tasks_data.dart';
import 'package:todo/widgets/task.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DbCubit, DbStates>(
      listener: (context, state) async {
        if (state is DbAddSuccess) {
          tasksData = await BlocProvider.of<DbCubit>(context)
              .fetchData('SELECT * FROM tasks');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
          );
        }
        if (state is DbDeleteSuccess) {
          tasksData = await BlocProvider.of<DbCubit>(context)
              .fetchData('SELECT * FROM tasks ');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
          );
        }
        if (state is DbAddFailure || state is DbDeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "The process faild",
                style: TextStyle(fontSize: 18),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            shadowColor: Colors.transparent,
            title: Text(
              "TO DO LIST",
              style: TextStyle(
                  color: AppColors.color1,
                  // fontFamily: "TacOne",
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              PopupMenuButton(
                onSelected: (value) async {
                  await BlocProvider.of<DbCubit>(context).deleteDb();
                },
                color: Colors.redAccent,
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text(
                      'Clear List',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Container(
            // height: 1000,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage("assests/images/todoIcon.png"),
                        size: 60,
                        color: AppColors.color1,
                      ),
                      Text(
                        "LIST OF TODO",
                        style: TextStyle(
                            // fontFamily: "TacOne",
                            wordSpacing: -5,
                            color: AppColors.color1,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // TaskBox(
                  //   title: tasksData![0]['title'],
                  //   description: tasksData![0]['description'],
                  //   color: tasksData![0]['color'],
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemExtent: 200,
                      itemBuilder: (context, index) {
                        return TaskBox(
                          index: index,
                          id: tasksData[index]['id'],
                          title: tasksData[index]['title'],
                          description: tasksData[index]['description'],
                          color: tasksData[index]['color'],
                          checked: tasksData[index]['checked'],
                        );
                      },
                      itemCount: tasksData.length,
                    ),
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Container(
            width: 80,
            height: 80,
            child: FloatingActionButton(
              materialTapTargetSize: MaterialTapTargetSize.padded,
              shape: CircleBorder(),
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.color2,
              onPressed: () {
                TextEditingController title = TextEditingController();
                TextEditingController description = TextEditingController();

                showModalBottomSheet(
                  barrierColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 780,
                    decoration: BoxDecoration(
                      color: AppColors.color1,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: 200,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: AppColors.white,
                                ),
                                controller: title,
                                decoration: InputDecoration(
                                  hintText: "Title",
                                  hintStyle: TextStyle(
                                    color: AppColors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: AppColors.white, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                        color: AppColors.white, width: 2),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                height: 400,
                                child: TextFormField(
                                  style: TextStyle(
                                    color: AppColors.white,
                                  ),
                                  controller: description,
                                  maxLines: 1000,
                                  decoration: InputDecoration(
                                    hintText: "Description...",
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.white,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                          color: AppColors.white, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: BorderSide(
                                        color: AppColors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Container(
                                // color: Colors.white,
                                width: 400,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.white,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Add Image (Optional)",
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                      Spacer(),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.image_rounded,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                                  minimumSize: WidgetStateProperty.all<Size>(
                                      Size(400, 70)),
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          AppColors.white),
                                  foregroundColor:
                                      WidgetStateProperty.all<Color>(
                                          AppColors.color1),
                                ),
                                onPressed: () async {
                                  int? response =
                                      await BlocProvider.of<DbCubit>(context)
                                              .insertData('''
                                        INSERT  INTO "tasks" ( "title","description" ,"color" , "checked")
                                        VALUES ( "${title.text}","${description.text}",${AppColors.color1.value}, "${false.toString()}" )
                                         ''') ??
                                          -1;
                                },
                                child: Text(
                                  "Add TODO",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.add_rounded,
                size: 60,
              ),
            ),
          ),
        );
      },
    );
  }
}
