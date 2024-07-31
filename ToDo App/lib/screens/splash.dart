import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bloc/db_bloc.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/constants/tasks_data.dart';
import 'package:todo/screens/home.dart';

class Splash_screen extends StatefulWidget {
  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
// Green

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.white),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            // Image.asset(
            //   "assests/images/splashImg.png",
            //   height: 400,
            //   width: 500,
            // ),
            Text(
              "T   O     🗒️\nD   O\nL   I   S   T",
              style: TextStyle(
                color: AppColors.color1,
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            CircularProgressIndicator(
              value: null, // Indeterminate (loading) state
              strokeWidth: 2.0, // Thickness of the circle
              backgroundColor: AppColors.color3, // Background color
              valueColor: AlwaysStoppedAnimation<Color>(
                  AppColors.color1), // Color of the circle
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

  void getData() async {
    tasksData = await BlocProvider.of<DbCubit>(context)
        .fetchData('SELECT * FROM tasks ')??[{
  'title':'not-found',
  'description':'not-found',
  'color':'Color(0xfff79e89)'
}];
    print(tasksData);
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });

    getData();
  }
}
