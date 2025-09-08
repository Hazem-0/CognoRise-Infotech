import 'package:bmi_calculator/provider/colors.dart';
import 'package:bmi_calculator/screens/gender_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color color3 = const Color(0xFF95CE9C);

  // Color color2 = Colors.yellowAccent;

  Color color1 = const Color(0xFFFFEEDC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          focal: Alignment.center,
          focalRadius: 0.1,
          radius: 1.2,
          colors: [
            color1,
            color3,
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 280,
            ),
            Image.asset(
              "assets/imgs/bmiIcon.png",
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("B",
                    style: TextStyle(
                      color: AppColors.lightRed,
                    )),
                Text("M",
                    style: TextStyle(
                      color: AppColors.lightYellow,
                    )),
                Text("I",
                    style: TextStyle(
                      color: AppColors.lightGreen,
                    )),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
              value: null, // Indeterminate (loading) state
              strokeWidth: 2.0, // Thickness of the circle
              backgroundColor: AppColors.lightYellow, // Background color
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.lightRed), // Color of the circle
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
        const Duration(
          seconds: 4,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GenderScreen(),
        ),
      );
    });
  }
}
