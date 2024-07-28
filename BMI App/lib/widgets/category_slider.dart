import 'package:bmi_calculator/provider/height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../provider/colors.dart';

class CategorySlider extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = ref.watch(heightProvider);
    var heightNotifier =ref.read(heightProvider.notifier);

    // TODO: implement build
    return Scaffold(
      body: Center(
        child:SfSliderTheme(
          data: SfSliderThemeData(
            activeTickColor: Color(0xFFC4C4C4),
            inactiveTickColor: Color(0xFFC4C4C4),
            activeMinorTickColor: Color(0xFFC4C4C4),
            inactiveMinorTickColor: Color(0xFFC4C4C4),
            tooltipTextStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            tooltipBackgroundColor: AppColors.lightCoffee,
            overlayColor: Colors.transparent,
            thumbColor: AppColors.coffee,
            activeTrackColor: Colors.transparent,
            inactiveTrackColor: Colors.transparent,
            tickSize: Size(10.0, -30.0),
            minorTickSize: Size(10.0, -30.0),
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
