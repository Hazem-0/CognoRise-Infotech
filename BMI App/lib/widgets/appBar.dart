import 'package:flutter/material.dart';

import '../provider/colors.dart';

final AppBar appBar = AppBar(
  backgroundColor: AppColors.backgroundColor,
  centerTitle: true,
  title: RichText(
    text: TextSpan(children: [
      TextSpan(
        text: "BMI ",
        style: TextStyle(
            color: AppColors.yellow, fontWeight: FontWeight.bold, fontSize: 40),
      ),
      TextSpan(
        text: "Calculator",
        style: TextStyle(
            color: AppColors.green, fontSize: 40, fontWeight: FontWeight.bold),
      ),
    ]),
  ),
);
