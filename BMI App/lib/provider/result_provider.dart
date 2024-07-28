import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultNotifier extends StateNotifier<void>
{
  ResultNotifier(super.state);
  String category='Not calculated' ;
  double bmi=0 ;
  double maxWeight=0;
  double minWeight=0;
  void calculate ({required double weight ,required double height    })
  {
    bmi = weight/(height/100*height/100);
    bmi=double.parse(bmi.toStringAsFixed(1));
    minWeight=18.5*(height/100*height/100);
    minWeight=double.parse(minWeight.toStringAsFixed(1));
    maxWeight=24.9*(height/100*height/100);
    maxWeight=double.parse(maxWeight.toStringAsFixed(1));

     if(bmi>=25)
      category='Overweight';
    else if(bmi>=18.5)
      category='Normal';
    else
      category='Underweight';
  }





}
final resultProvider = StateNotifierProvider<ResultNotifier, void>((ref) {
  return ResultNotifier(0);
});