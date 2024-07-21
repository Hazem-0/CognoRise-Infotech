
import 'package:bmi_calculator/provider/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeightAgeBox extends StatelessWidget {
  String boxName;
  Widget child ;
  WeightAgeBox({required this.boxName , required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x22000000),
            offset: Offset(2, 2),
            blurRadius: 5,
            blurStyle: BlurStyle.outer)
      ], color: AppColors.lightCoffee, borderRadius: BorderRadius.circular(30)),
      width: 170,
      height: 184,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            boxName,
            style: TextStyle(
                color: AppColors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Text(
            "26",
            style: TextStyle(
                color: AppColors.coffee,
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
          child,

        ],
      ),
    );
  }
}
