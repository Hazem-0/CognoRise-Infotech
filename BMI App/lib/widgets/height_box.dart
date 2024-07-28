import 'package:bmi_calculator/provider/gender_provider.dart';
import 'package:bmi_calculator/provider/height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/colors.dart';

class HeightBox extends ConsumerWidget {
  double sliderValue = 170;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var height = ref.watch(heightProvider);
    var heightNotifier = ref.read(heightProvider.notifier);
    int gender = ref.watch(genderProvider);
    Color bgcolor =
        (gender == 1) ? AppColors.lighterGreen : AppColors.lightCoffee;
    Color fgcolor = (gender == 1) ? AppColors.green : AppColors.coffee;

    TextEditingController textFieldControler = TextEditingController();
    void _showTextFieldPopup() {
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
                  heightNotifier.changeHeight(double.parse(text));
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          );
        },
      );
    }

    return Container(
      width: 370,
      height: 240,
      decoration: BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              color: Color(0x22000000),
              blurRadius: 7,
              blurStyle: BlurStyle.outer),
        ],
      ),
      // color: AppColors.lightCoffee,

      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            "Height (cm)",
            style: TextStyle(fontSize: 16, color: Color(0xFFACACAC)),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () => _showTextFieldPopup(),
            child: Text(
              "${height}",
              style: TextStyle(
                  color: fgcolor, fontWeight: FontWeight.bold, fontSize: 48),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SfSliderTheme(
            data: SfSliderThemeData(
              activeTickColor: Color(0xFFC4C4C4),
              inactiveTickColor: Color(0xFFC4C4C4),
              activeMinorTickColor: Color(0xFFC4C4C4),
              inactiveMinorTickColor: Color(0xFFC4C4C4),
              tooltipTextStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              tooltipBackgroundColor: bgcolor,
              overlayColor: Colors.transparent,
              thumbColor: fgcolor,
              activeTrackColor: Colors.transparent,
              inactiveTrackColor: Colors.transparent,
              tickSize: Size(3.0, -30.0),
              minorTickSize: Size(3.0, -15.0),
              tickOffset: Offset(0.0, 35.0),
            ),
            child: SfSlider(
              thumbShape: _SfThumbShape(),
              stepSize: 0.5,
              minorTicksPerInterval: 1,
              enableTooltip: true,
              showTicks: true,
              interval: 20,
              max: 260,
              min: 60,
              value: height,
              onChanged: (value) => heightNotifier.changeHeight(value),
            ),
          ),
        ],
      ),
    );
  }
}

class _SfThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
    final Path path = Path();

    path.moveTo(center.dx, center.dy);
    path.lineTo(center.dx + 7, center.dy - 10);
    path.lineTo(center.dx - 7, center.dy - 10);
    path.close();
    context.canvas.drawPath(
        path,
        Paint()
          ..color = themeData.thumbColor!
          ..style = PaintingStyle.fill
          ..strokeWidth = 2);
  }
}
