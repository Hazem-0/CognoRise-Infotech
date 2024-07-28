import 'package:flutter/material.dart';
import 'package:summer_training/veiw/home_veiw.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: width,
          height: height,
          color: Color(0xAA333EFF),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xBAFFFFFF),
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(200, 250),
                    bottomLeft: Radius.elliptical(170, 300))),
            width: width,
            height: height,
          ),
        ),
        Positioned(
          bottom: 20,
          top: 20,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(200, 300),
                    bottomLeft: Radius.elliptical(200, 300))),
            width: width,
            height: height,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0x55AAAAAA), shape: BoxShape.circle),
                  width: width / 3,
                  height: height / 3,
                  child: Image.asset("assests/imgs/cxLogo.png"),
                ),
                SizedBox(
                  height: height / 12,
                ),
                Text(
                  "Welcome to ConnectX",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 56,
                      fontFamily: "Loving"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                    onTap: () => null,
                    child: Container(
                      width: width / 4,
                      height: height / 4,
                      decoration: BoxDecoration(
                          color: Color(0xAA333EFF),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, -3),
                            ),
                          ]),
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ),
                    InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage())),
                      child: Container(
                        width: width / 4,
                        height: height / 4,
                        decoration: BoxDecoration(
                            color: Color(0xAA333EFF),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 5,
                                offset: Offset(0, -3),
                              ),
                            ]),
                        child: Icon(
                          Icons.home_outlined,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
