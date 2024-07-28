import 'package:bmi_calculator/widgets/height_box.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/colors.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  double sliderValue=170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeightBox() );
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