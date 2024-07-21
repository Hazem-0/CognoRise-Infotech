import 'package:calculator_app/providers/darkMode_provider.dart';
import 'package:calculator_app/providers/shared_preferences.dart';
import 'package:calculator_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StoreSimpleData.init();
  runApp( ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context , WidgetRef ref ) {
    ref.read(darkModeProvider.notifier).getStoredState();
    return ScreenUtilInit(
      designSize: Size(360,690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child){
        return MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Calculator',

          home: HomeScreen(),
        );
      }

    );
  }
}

