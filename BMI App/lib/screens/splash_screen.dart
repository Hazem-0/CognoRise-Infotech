
import 'package:cx_final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color color3 = Color(0xFFB71A1A);

  Color color2 = Color(0xFF2780B8);

  Color color1 = Color(0xFFFFEEDC);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: RadialGradient(
              focal: Alignment.center,
              focalRadius: 0.05,
              radius: 1.11,
              colors: [
                color1,
                color3,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(

              children: [
                SizedBox(
                  height: 260,
                ),
                Image.asset(
                  "assests/images/splash_screen_img.png",
                  height: 270,
                ),
                Text(
                  "Nile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 90,
                    fontFamily: "Loving",
                  ),
                ),
                SizedBox(height: 50,),
                CircularProgressIndicator(
                  value: null, // Indeterminate (loading) state
                  strokeWidth: 2.0, // Thickness of the circle
                  backgroundColor: color2, // Background color
                  valueColor:
                  AlwaysStoppedAnimation<Color>(color1), // Color of the circle
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>MyHomePage(title: ""),
      //   ),
      // );
    });
  }
}
