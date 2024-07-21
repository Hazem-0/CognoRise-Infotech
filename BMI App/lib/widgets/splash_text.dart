import 'package:flutter/material.dart';

class SplashText extends StatelessWidget {
  String tokenText ;
  Color  textColor;

  SplashText({required this.tokenText,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      tokenText,
      style: TextStyle(
        color: textColor,
        fontSize: 90,
        fontFamily: "TacOne",
        shadows: [
          Shadow(offset: Offset(2.0, 5.0),
            blurRadius: 15.0,
            color: Color.fromARGB(255, 0, 0, 0),)
        ]
      ),
    );
  }
}
