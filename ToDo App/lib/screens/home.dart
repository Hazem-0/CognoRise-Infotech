import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/data/local/sqflite.dart';
import 'package:todo/widgets/task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Sqflite sql = new Sqflite();
  List tasks = [0];
  String x = '', y = '', z = '';
  void readData() async {
    tasks = await sql.readData('SELECT * FROM tasks ');
    // print(widget.tasks);
    x = tasks[2]['title'];
    y = tasks[2]['desciption'];
    z = tasks[2]['color'];
    print(x);
    print(y);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TO DO LIST",
          style: TextStyle(
              color: AppColors.color1,
              // fontFamily: "TacOne",
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () => null, icon: Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
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
                height: 50,
              ),
              TaskBox(
                title: x,
                description: y,
                color: z,
              ),
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
                                    style: TextStyle(color: AppColors.white),
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
                                  WidgetStateProperty.all<Size>(Size(400, 70)),
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  AppColors.white),
                              foregroundColor: WidgetStateProperty.all<Color>(
                                  AppColors.color1),
                            ),
                            onPressed: () async {
                              Sqflite sql = new Sqflite();
                              ;
                              int response = await sql.insertData('''
                                    INSERT  INTO "tasks" ( "id" , "title","desciption" ,"color")
                                    VALUES ( "${3}","${title.text}","${description.text}","${AppColors.color1}")
                                     ''');
                              print(response);
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
  }
}
