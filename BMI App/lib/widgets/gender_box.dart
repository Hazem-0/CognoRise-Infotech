import 'package:bmi_calculator/provider/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  String gender ;

  GenderBox({required this.gender});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: 370,
        height: 180,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color(0x22000000) , offset: Offset(2,2),blurRadius: 10,blurStyle: BlurStyle.outer)
          ],
          borderRadius: BorderRadius.circular(30),
          color: (gender=="Male")?AppColors.lighterGreen:AppColors.lightCoffee,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(gender,style: TextStyle(fontSize: 32 ,fontWeight: FontWeight.bold ,color: (gender=="Male")?AppColors.darkGreen:AppColors.coffee),),
            SizedBox(width: 100,),
          ],
        ),
      ),
    );
  }
}
