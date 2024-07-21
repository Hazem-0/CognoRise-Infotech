import 'package:calculator_app/providers/equation_provider.dart';
import 'package:calculator_app/providers/layout_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends ConsumerStatefulWidget {
  Color color;
  Color textColor;
  String innerSymbol;

  @override
  ConsumerState<Button> createState() => _ButtonState();

  Button(
      {required this.textColor,
      required this.color,
      required this.innerSymbol});
}

class _ButtonState extends ConsumerState<Button> {
  @override
  bool isLandScape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // bool isPhone(BuildContext context)=>MediaQuery.of(context).size.width<600 &&  !isLandScape(context);
  List<String> equation = [];

  Widget build(BuildContext context) {
    var equation = ref.watch(equationProvider);
    var equationNotifer = ref.read(equationProvider.notifier);
    var dotFlag = ref.watch(dotFlagProvider);
    var dotFlagNotifer = ref.read(dotFlagProvider.notifier);
    var opFlag = ref.watch(opFlagProvider);
    var opFlagNotifer = ref.read(opFlagProvider.notifier);
    var layoutFlagNotifer = ref.read(layoutProvider.notifier);
    return InkWell(
      onTap: () {
        if (widget.innerSymbol == 'C') {
          dotFlagNotifer.state = 0;
          opFlagNotifer.state = 0;
          equationNotifer.clearString();
        } else if (widget.innerSymbol == '⌫') {
          if (equation[0][equation.length - 1] == '.') dotFlagNotifer.state = 0;
          equationNotifer.removeString();
        } else if (widget.innerSymbol == '+/-') {
          equationNotifer.toggleSign();
        } else if (widget.innerSymbol == '%') {
          equationNotifer.precentage();
        } else {
          if (equation[0].length < 20) {
            if (widget.innerSymbol == '.') {
              if (equation[0] == '0') {
                equationNotifer.replaceString("0.");
                dotFlagNotifer.state = 1;
              } else if (ref.watch(dotFlagProvider) == 0) {
                dotFlagNotifer.state = 1;
                equationNotifer.addString(widget.innerSymbol);
              }
            } else if (widget.innerSymbol == '=') {
              {
                equationNotifer.calculate();
              }
            }
            else if (widget.innerSymbol == '+' ||
                widget.innerSymbol == '-' ||
                widget.innerSymbol == '×' ||
                widget.innerSymbol == '÷')
            {
              if (equation[0] == "0") {
                equationNotifer.replaceString("0" + widget.innerSymbol);
                opFlagNotifer.state = 1;
              }
else {
               if (opFlag == 1) {
                equationNotifer.calculate();
                equationNotifer
                    .replaceString(equationNotifer.state[1].toString());
                opFlagNotifer.state = 1;
              } else {
                if (equation[1] != 0.0)
                  equationNotifer.replaceString(equation[1].toString());
                opFlagNotifer.state = 1;
              }
              if (equation[0] != "0" + widget.innerSymbol) {
                equationNotifer.addString(widget.innerSymbol);
              }
            }}

            else {

              equationNotifer.addString(widget.innerSymbol);
            }
          }
        }
      },
      child: Container(
        width: 80.w,
        height: layoutFlagNotifer.buttonWidth(context).h,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(
                layoutFlagNotifer.buttonRadius(context).r)),
        child: Center(
            child: Text(
          widget.innerSymbol,
          style: TextStyle(
              color: widget.textColor,
              fontSize: layoutFlagNotifer.buttonFontSize(context).sp),
        )),
      ),
    );
  }
}
