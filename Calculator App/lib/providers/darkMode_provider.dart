
import 'package:calculator_app/providers/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkModeNotifier extends StateNotifier<bool>
{
  DarkModeNotifier(super.state);
  Color lightBackgroundColor =Color(0xFFF1F2F3);
  Color darkBackgroundColor = Color(0xFF17171C);
  Color staticButtonColor = Color(0xFF4B5EFC);
  Color  ligtUpperButtonColor =Color(0xFFD2D3DA);
  Color  darkUpperButtonColor =Color(0xFF4E505F);
  Color darkButtonsColor = Color(0xFF2E2F38);
  Color ligtButtonsColor =Color(0xFFFFFFFF);
  Color ligtTextColor = Color(0xFF000000);
  Color darkTextColor =Color(0xFFFFFFFF);

  void toggleProvider(bool value)
  async {
    await StoreSimpleData.setItem(key: "darkMode",value: value);
    state=value;
  }
  void getStoredState() async
  {
    state= await StoreSimpleData.getItem(key: "darkMode", type: "bool");
  }


}


final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>((ref) {
  return DarkModeNotifier(false);
});