import 'package:bmi_calculator/provider/age_provider.dart';
import 'package:bmi_calculator/provider/colors.dart';
import 'package:bmi_calculator/provider/gender_provider.dart';
import 'package:bmi_calculator/provider/weight_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightAgeBox extends ConsumerWidget {
  String boxName;
  TextEditingController textFieldControler = TextEditingController();
  WeightAgeBox({required this.boxName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int age = ref.watch(ageProvider);
    var ageNotifier = ref.read(ageProvider.notifier);
    double weight = ref.watch(weightProvider);
    var weightNotifier = ref.read(weightProvider.notifier);
    var gender = ref.watch(genderProvider);
    Color bgcolor = (gender == 1 || gender == 0)
        ? AppColors.lighterGreen
        : AppColors.lightCoffee;
    Color fgcolor =
        (gender == 1 || gender == 0) ? AppColors.green : AppColors.coffee;

    void _showTextFieldPopup(String boxName) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: bgcolor,
            title: Text(
              'Edit value',
              style: TextStyle(color: fgcolor),
            ),
            content: TextField(
              keyboardType: TextInputType.number,

              style: TextStyle(color: fgcolor),
              controller: textFieldControler,
              autofocus: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: bgcolor,
                hintText: 'New value',
                hintStyle: TextStyle(color: fgcolor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: fgcolor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: fgcolor),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: fgcolor),
                ),
                onPressed: () {
                  String text = textFieldControler.text;
                  if (boxName == "Age") {
                    ageNotifier.changeAge(int.parse(text));
                  } else {
                    weightNotifier.changeWeight(double.parse(text));
                  }
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color(0x22000000),
            // offset: Offset(2, 2),
            blurRadius: 5,
            blurStyle: BlurStyle.outer)
      ], color: bgcolor, borderRadius: BorderRadius.circular(30)),
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
          InkWell(
            onTap: () {
              _showTextFieldPopup(boxName);
            },
            child: Text(
              (boxName == "Age") ? age.toString() : weight.toString(),
              style: TextStyle(
                  color: fgcolor, fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (boxName == 'Age') {
                    ageNotifier.minusAge(1);
                  } else {
                    weightNotifier.minusWeight(0.5);
                  }
                },
                child: Icon(Icons.remove, size: 30),
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all<Size>(Size(50, 50)),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  foregroundColor: WidgetStateProperty.all<Color>(fgcolor),
                  shape: WidgetStateProperty.all<CircleBorder>(CircleBorder()),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (boxName == 'Age') {
                    ageNotifier.plusAge(1);
                  } else {
                    weightNotifier.plusWeight(0.5);
                  }
                },
                child: Icon(Icons.add, size: 30),
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all<Size>(Size(50, 50)),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  foregroundColor: WidgetStateProperty.all<Color>(fgcolor),
                  shape: WidgetStateProperty.all<CircleBorder>(CircleBorder()),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
