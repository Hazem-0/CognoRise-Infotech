import 'package:bmi_calculator/provider/age_provider.dart';
import 'package:bmi_calculator/provider/height_provider.dart';
import 'package:bmi_calculator/provider/result_provider.dart';
import 'package:bmi_calculator/provider/weight_provider.dart';
import 'package:bmi_calculator/widgets/appBar.dart';
import 'package:bmi_calculator/widgets/height_box.dart';
import 'package:bmi_calculator/widgets/result_bar.dart';
import 'package:bmi_calculator/widgets/weight_age_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/colors.dart';
import '../provider/gender_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var resultNotifier = ref.watch(resultProvider.notifier);
    int age = ref.watch(ageProvider);
    double height = ref.watch(heightProvider);
    double weight = ref.watch(weightProvider);
    int gender = ref.watch(genderProvider);
    Color bgcolor =
        (gender == 1) ? AppColors.lighterGreen : AppColors.lightCoffee;
    Color fgcolor = (gender == 1) ? AppColors.green : AppColors.coffee;

    void _showResultPopup() {
      showDialog(
        barrierColor: Colors.black12,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: fgcolor,
            elevation: 10,
            surfaceTintColor: Colors.transparent,
            // shadowColor: Colors.transparent

            backgroundColor: bgcolor,
            titlePadding: EdgeInsets.symmetric(horizontal: 120),
            title: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  'Your BMI:',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            content: Container(
              width: 370,
              height: 300,
              child: Column(
                children: [
                  Text(
                    "${resultNotifier.bmi}",
                    style: TextStyle(
                      color: fgcolor,
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ResultBar(
                    category: '${resultNotifier.category}',
                  ),
                  //Rating(rating: 2.5, size: 60),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "${weight} Kg",
                        style: TextStyle(
                            fontSize: 18,
                            color: fgcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${height} cm",
                        style: TextStyle(
                            fontSize: 18,
                            color: fgcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 14,
                      ),
                      Text(
                        "${age}",
                        style: TextStyle(
                            fontSize: 18,
                            color: fgcolor,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        (gender == 2) ? 'Female' : 'Male',
                        style: TextStyle(
                            fontSize: 18,
                            color: fgcolor,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Weight ",
                        style: TextStyle(fontSize: 14, color: AppColors.grey),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        "Height",
                        style: TextStyle(fontSize: 14, color: AppColors.grey),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        "Age",
                        style: TextStyle(fontSize: 14, color: AppColors.grey),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Gender",
                        style: TextStyle(fontSize: 14, color: AppColors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Healthy weight for the height:",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Text(
                    "${resultNotifier.minWeight} Kg-${resultNotifier.maxWeight} Kg",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: fgcolor,
                    ),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  minimumSize: WidgetStateProperty.all<Size>(Size(320, 70)),
                  backgroundColor: WidgetStateProperty.all<Color>(fgcolor),
                  foregroundColor:
                      WidgetStateProperty.all<Color>(AppColors.backgroundColor),
                ),
                child: Text('Close',
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Please Modify the values",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeightAgeBox(
                  boxName: "Weight (kg)",
                ),
                WeightAgeBox(
                  boxName: "Age",
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            HeightBox(),
            SizedBox(
              height: 140,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    minimumSize: WidgetStateProperty.all<Size>(Size(350, 70)),
                    backgroundColor: WidgetStateProperty.all<Color>(fgcolor),
                    foregroundColor: WidgetStateProperty.all<Color>(
                        AppColors.backgroundColor)),
                onPressed: () {
                  resultNotifier.calculate(weight: weight, height: height);
                  _showResultPopup();
                },
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
