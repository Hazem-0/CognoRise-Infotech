import 'package:bmi_calculator/provider/colors.dart';
import 'package:bmi_calculator/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/gender_provider.dart';
import '../widgets//gender_box.dart';
import '../widgets/appBar.dart';

class GenderScreen extends ConsumerWidget {
  double sliderValue = 170;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int genderPro = ref.watch(genderProvider);
    Color bgcolor =
        (genderPro == 1) ? AppColors.lighterGreen : AppColors.lightCoffee;
    Color fgcolor = (genderPro == 1) ? AppColors.green : AppColors.coffee;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: appBar,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Please choose your gender",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 370,
                height: 210,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: (genderPro == 1)
                            ? AppColors.cyan
                            : Color(0x22000000),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer)
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.lighterGreen,
                ),
                child: GenderBox(gender: "Male")),
            SizedBox(
              height: 30,
            ),
            Container(
                width: 370,
                height: 210,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: (genderPro == 2)
                            ? AppColors.coffee
                            : Color(0x22000000),
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        blurStyle: BlurStyle.outer)
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.lightCoffee,
                ),
                child: GenderBox(gender: "Female")),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      minimumSize: WidgetStateProperty.all<Size>(Size(350, 70)),
                      backgroundColor: WidgetStateProperty.all<Color>(fgcolor),
                      foregroundColor: WidgetStateProperty.all<Color>(
                          AppColors.backgroundColor)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
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
