import 'package:calculator_app/providers/darkMode_provider.dart';
import 'package:calculator_app/providers/equation_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../widgets//button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var darkProvider=ref.watch(darkModeProvider);
    var darkNotifier =ref.watch(darkModeProvider.notifier);
    var equation =ref.watch(equationProvider);
    Color backgroundColor= darkProvider?darkNotifier.darkBackgroundColor:darkNotifier.lightBackgroundColor;
    Color buttonsColors = darkProvider?darkNotifier.darkButtonsColor:darkNotifier.ligtButtonsColor;
    Color upperButtonsColors= darkProvider?darkNotifier.darkUpperButtonColor:darkNotifier.ligtUpperButtonColor;
    Color staticButtonColors=darkNotifier.staticButtonColor;
    Color textColor= darkProvider?darkNotifier.darkTextColor:darkNotifier.ligtTextColor;
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      backgroundColor:backgroundColor,
      body: Column(
        children: [
          SizedBox(height: screenHeight/15,),
          Center(
            child: FlutterSwitch(

              toggleColor: Color(0xFFD2D3DA),
              activeColor: darkNotifier.darkButtonsColor,
              inactiveColor: darkNotifier.ligtButtonsColor,
              value: darkProvider,
              onToggle:(value)=> darkNotifier.toggleProvider(value),
              showOnOff: true,
              activeText: '',
              inactiveText: '',
              activeIcon: Icon(Icons.dark_mode,color:Colors.blueAccent ,),
              inactiveIcon: Icon(Icons.sunny ,color: Colors.yellowAccent,),

            ),
          ),

          Padding(
            padding:  EdgeInsets.all(5.0.r),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                equation[0],
                style: TextStyle(color: Colors.grey, fontSize: 25.h),
              ),
              // color: Colors.greenAccent,
              height: screenHeight/9,
              width: double.infinity,
            ),
          ),
          Padding(
            padding:  EdgeInsets.all(5.0.r),
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(
                equation[1].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 38.h),
              ),
              // color: Colors.red,
              height: screenHeight/7,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      textColor: textColor,
                      color: upperButtonsColors,
                      innerSymbol: 'C',
                    ),
                    Button(
                      textColor: textColor,
                      color: upperButtonsColors,
                      innerSymbol: '+/-',
                    ),
                    Button(
                      textColor: textColor,
                      color: upperButtonsColors,
                      innerSymbol: '%',
                    ),
                    Button(
                      textColor: textColor,
                      color: staticButtonColors,
                      innerSymbol: '÷',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      textColor: textColor,
                      color:buttonsColors,
                      innerSymbol: '7',
                    ),
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '8',
                    ),
                    Button(
                      textColor: textColor,
                      color:buttonsColors,
                      innerSymbol: '9',
                    ),
                    Button(
                      textColor: textColor,
                      color: staticButtonColors,
                      innerSymbol: '×',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      textColor: textColor,
                      color:buttonsColors,
                      innerSymbol: '4',
                    ),
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '5',
                    ),
                    Button(
                      textColor: textColor,
                      color:buttonsColors,
                      innerSymbol: '6',
                    ),
                    Button(
                      textColor: textColor,
                      color: staticButtonColors,
                      innerSymbol: '-',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '1',
                    ),
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '2',
                    ),
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '3',
                    ),
                    Button(
                      textColor: textColor,
                      color: staticButtonColors,
                      innerSymbol: '+',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '.',
                    ),
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '0',
                    ),
                    Button(
                      textColor: textColor,
                      color: buttonsColors,
                      innerSymbol: '⌫',
                    ),
                    Button(
                      textColor: textColor,
                      color: staticButtonColors,
                      innerSymbol: '=',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
