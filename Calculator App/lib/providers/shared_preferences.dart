import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreSimpleData {




  static SharedPreferences? obj;

  static init() async {
    obj = await SharedPreferences.getInstance();
  }

  static setItem({required String key, required dynamic value}) async {
    if(value is bool) await obj!.setBool(key, value);
    else if (value is int) await obj!.setInt(key, value);
    else if (value is String) await obj!.setString(key, value);
    else if (value is double) await obj!.setDouble(key, value);
  }

  static setList({required String key, required List<String> value}) async {
    await obj!.setStringList(key, value);
  }

  static deleteItem({required String key}) async {
    await obj!.remove(key);
  }

 static  getItem({required String key, required String type}) async {
    if (type == "bool") {
      return await obj!.getBool(key);
    }
    if (type == "String") {
      return await obj!.getString(key);
    }
    if (type == "int") {
      return await obj!.getInt(key);
    }
    if (type == "double") {
      return await obj!.getDouble(key);
    }
    if (type == "List<String>") {
      return await obj!.getStringList(key);
    }
  }

  static clearAllData() async {
    await obj!.clear();
  }
}
