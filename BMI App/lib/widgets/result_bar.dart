// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bmi_calculator/provider/colors.dart';

class ResultBar extends StatelessWidget {
  final String category;
  Color? color;
  double? left;
  ResultBar({
    Key? key,
    required this.category,
  }) {
    if (category == 'Underweight') {
      color = AppColors.yellow;
      left = 10;
    } else if (category == 'Normal') {
      color = AppColors.green;
      left = 115;
    } else {
      color = AppColors.lightRed;
      left = 220;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 500,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              //-------------------------------------------------
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              //---------------------------------------------------------------------------------
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              Container(
                width: 5,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.lightRed,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            left: left,
            child: Container(
              width: 85,
              height: 25,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(
                      200,
                      200,
                    ),
                    bottomRight: Radius.elliptical(
                      200,
                      200,
                    ),
                    topLeft: Radius.elliptical(
                      100,
                      0,
                    ),
                    topRight: Radius.elliptical(
                      100,
                      0,
                    ),
                  )),
              child: Center(
                child: Text(
                  category,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                      fontSize: 10),
                ),
              ),
            ))
      ],
    );
  }
}
