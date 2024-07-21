
import 'package:calculator_app/providers/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutNotifier extends StateNotifier
{

  LayoutNotifier(super.state );


  bool isLandScape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  double buttonWidth(BuildContext context)
  {
    if(isLandScape(context))
      {
        return 40;
      }

    return 70;
  }
  double buttonFontSize(BuildContext context)
  {
    if(isLandScape(context))
    {
      return 12;
    }

    return 32;
  }
  double buttonRadius(BuildContext context)
  {
    if(isLandScape(context))
    {
      return 12;
    }

    return 24;
  }


}


final layoutProvider = StateNotifierProvider<LayoutNotifier,void>((ref) {
  return LayoutNotifier(Size(600,400));
});