import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:todo/bloc/bloc/db_bloc.dart';
import 'package:todo/bloc/states/db_states.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/tasks_data.dart';
import 'package:todo/screens/home.dart';

class DetailsScreen extends StatelessWidget {
  String title = '';
  String description = '';
  int id = 1;
  final int index;
  DetailsScreen({super.key, required this.index}) {
    title = tasksData[index]['title'];
    description = tasksData[index]['description'];
    id = tasksData[index]['id'];
  }

  @override
  Widget build(BuildContext context) {
    void showResultPopup() {
      showDialog(
        barrierColor: Colors.black12,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 10,
            surfaceTintColor: Colors.transparent,
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  minimumSize: WidgetStateProperty.all<Size>(Size(320, 50)),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.white),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.redAccent),
                ),
                child: Text('Delete TODO',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () async {
                  await BlocProvider.of<DbCubit>(context).deleteData('''
                            DELETE FROM  "tasks" WHERE id= "$id"
                            ''');
                  print(tasksData);
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  minimumSize: WidgetStateProperty.all<Size>(Size(320, 50)),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.white),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(Colors.greenAccent),
                ),
                child: Text('Cancel',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }

    void showColorPickerPopup() {
      Color newColor = Color(tasksData[index]['color']);
      showDialog(
        barrierColor: Colors.black12,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Pick a Color"),
            content: ColorPicker(
              pickerColor: newColor,
              onColorChanged: (color) {
                newColor = color;
              },
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 10,
            surfaceTintColor: Colors.transparent,
            actions: <Widget>[
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(AppColors.color2),
                  ),
                  onPressed: () async {
                    await BlocProvider.of<DbCubit>(context).updateData('''
                                    UPDATE  "tasks" SET "color"="${newColor.value}"  
                                      WHERE id="$id"
                                       ''');
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    }

    return BlocConsumer<DbCubit, DbStates>(
      listener: (context, state) async {
        if (state is DbDeleteSuccess) {
          tasksData = await BlocProvider.of<DbCubit>(context)
              .fetchData('SELECT * FROM tasks ');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false,
          );
        }
        if (state is DbUpdateSuccess) {
          tasksData = await BlocProvider.of<DbCubit>(context)
              .fetchData('SELECT * FROM tasks ');
          title = tasksData[index]['title'];
          description = tasksData[index]['description'];
          id = tasksData[index]['id'];
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(index: index),
            ),
            (Route<dynamic> route) => false,
          );
        }
        if (state is DbUpdateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("The process faild"),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (Route<dynamic> route) => false,
                    )),
            actions: [
              IconButton(
                  onPressed: () {
                    showColorPickerPopup();
                  },
                  icon: Icon(
                    Icons.color_lens,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    TextEditingController titleController =
                        TextEditingController();
                    TextEditingController descriptionController =
                        TextEditingController();
                    titleController.text = title;
                    descriptionController.text = description;
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
                                    controller: titleController,
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
                                      maxLines: 1000,
                                      controller: descriptionController,
                                      decoration: InputDecoration(
                                        hintText: "Description...",
                                        hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.white,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: AppColors.white, width: 2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                            style: TextStyle(
                                                color: AppColors.white),
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
                                      minimumSize:
                                          WidgetStateProperty.all<Size>(
                                              Size(400, 70)),
                                      backgroundColor:
                                          WidgetStateProperty.all<Color>(
                                              AppColors.white),
                                      foregroundColor:
                                          WidgetStateProperty.all<Color>(
                                              AppColors.color1),
                                    ),
                                    onPressed: () async {
                                      print(titleController.text);
                                      print(index);
                                      await BlocProvider.of<DbCubit>(context)
                                          .updateData('''
                                    UPDATE  "tasks" SET "title"="${titleController.text}","description"="${descriptionController.text}" 
                                    WHERE id="$id"
                                     ''');
                                    },
                                    child: Text(
                                      "Edit TODO",
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
                  icon: Icon(
                    Icons.mode_edit_outlined,
                    size: 30,
                  )),
              IconButton(
                onPressed: () => showResultPopup(),
                icon: Icon(
                  Icons.delete_outline_outlined,
                  size: 30,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
