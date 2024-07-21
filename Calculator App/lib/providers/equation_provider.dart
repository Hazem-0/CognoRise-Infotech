import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquationNotifier extends StateNotifier<List<dynamic>> {
  EquationNotifier() : super(['0', 0.0]);
  static bool precented=false;
  void addString(String value) {
    if (state[0] == "0") {
      state[0] = "";
    }
    state = [state[0]+value, state[1]];
  }

  void removeString() {

    print(state[0].length);
    if (state[0].length == 1) {
      state=["0",state[1]];
    } else  {
      state = [state[0].substring(0, state[0].length - 1), state[1]];
    }
  }

  void clearString() {
    state = ["0", 0.0];
  }
  void replaceString(String value) {
    state = [value, state[1]];
  }

  void toggleSign( )
  {

    String value =state[0],operand1 = '', operand2 = '', op = '';
    double ?temp;
    final regex = RegExp(r'([+-]?\d+(\.\d+)?)([\+\-\×/÷])([+-]?\d+(\.\d+)?)');
    final match = regex.firstMatch(state[0]);
    if (match != null) {
      operand1 = match.group(1)!;
      op = match.group(3)!;
      operand2 = match.group(4)!;
      temp =double.parse(operand2)*-1;
      state=[operand1+op+temp.toString()!,state[1]];


    }
    else if((value[value.length-1]!='-'||value[value.length-1]!='+'||value[value.length-1]!='÷'||value[value.length-1]!='×')&&value!="0")
      {
        print(value);
        temp=double.parse(value)*-1;
        state=[temp.toString()!,state[1]];
      }

  }

  void precentage()
  {
    String value =state[0],operand1 = '', operand2 = '', op = '';
    double ?temp;
    final regex = RegExp(r'([+-]?\d+(\.\d+)?)([\+\-\×/÷])([+-]?\d+(\.\d+)?)');
    final match = regex.firstMatch(state[0]);
    if (match != null) {
      operand1 = match.group(1)!;
      op = match.group(3)!;
      operand2 = match.group(4)!;
      if(precented)
        {
          temp =double.parse(operand2)*100;
          precented=false;
        }
      else
        {
          temp =double.parse(operand2)/100;
          precented=true;
        }
      state=[operand1+op+temp.toString()!,state[1]];


    }
    else if((value[value.length-1]!='-'||value[value.length-1]!='+'||value[value.length-1]!='÷'||value[value.length-1]!='×')&&value!="0")
    {
      print(value);
      if (precented) {
        temp = double.parse(value) * 100;
        precented=false;
      }
      else
        {
          temp = double.parse(value) / 100;
          precented=true;
        }

      state=[temp.toString()!,state[1]];
    }
  }


  void calculate() {
    String operand1 = '', operand2 = '', op = '';
    final regex = RegExp(r'([+-]?\d+(\.\d+)?)([\+\-\×/÷])([+-]?\d+(\.\d+)?)');
    final match = regex.firstMatch(state[0]);
    if (match != null) {
      operand1 = match.group(1)!;
      op = match.group(3)!;
      operand2 = match.group(4)!;
    }

    double result = 0;

    switch (op) {
      case '+':
        result = double.parse(operand1) + double.parse(operand2);
        break;
      case '-':
        result = double.parse(operand1) - double.parse(operand2);
        break;
      case '×':
        result = double.parse(operand1) * double.parse(operand2);
        break;
      case '÷':
        if (double.parse(operand2) != 0) {
          result = double.parse(operand1) / double.parse(operand2);
        } else {
          result = double.infinity;
        }
        break;
      default: {
        if(state[0][state[0].length-1]=='+'||state[0][state[0].length-1]=='÷'||state[0][state[0].length-1]=='×'||state[0][state[0].length-1]=='-')
          state[0]=state[0].substring(0,state[0].length-1);
        if(state[0].isEmpty)
          state[0]='0';
        result=double.parse(state[0]);
      } break;
    }
  print(operand1);
    state = [state[0], result];
  }
}

final equationProvider = StateNotifierProvider<EquationNotifier, List<dynamic>>((ref) {
  return EquationNotifier();
});

final opFlagProvider = StateProvider<int>((ref) {
  return 0 ;
});

final dotFlagProvider = StateProvider<int>((ref) {
  return 0 ;
});