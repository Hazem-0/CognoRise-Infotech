import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/bloc/checkbox_cubit.dart';
import 'package:todo/bloc/bloc/db_bloc.dart';
import 'package:todo/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider(  create: (context) => DbCubit(),),
          BlocProvider(create: (context) => CheckboxCubit(),),
        ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: Splash_screen(),
      ),
    );
  }
}
