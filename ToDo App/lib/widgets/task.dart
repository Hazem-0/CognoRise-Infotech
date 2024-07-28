import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/screens/details.dart';

class TaskBox extends StatefulWidget {
  final String title;
  final String description;
  final String color;
  const TaskBox(
      {super.key,
      required this.title,
      required this.description,
      required this.color});

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailsScreen())),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 180,
            decoration: BoxDecoration(
                color: AppColors.color2,
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
                Container(
                  width: 40,
                  // height: 40,
                  child: Checkbox(
                    side: BorderSide(color: AppColors.white),
                    activeColor: Colors.green,
                    onChanged: (value) => null,
                    value: false,
                  ),
                ),
                SizedBox(
                    // height: 100,
                    width: 1,
                    child: Container(
                      width: 2,
                      height: 150,
                      color: AppColors.offWhite,
                    )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              left: 350,
              child: IconButton(
                onPressed: () => null,
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
