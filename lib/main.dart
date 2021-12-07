import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'My_themData.dart';
import 'ui/home/homeScreen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
theme: My_themeData.light_Them,

      routes: {
        HomeScreen.routeName:(buildContext)=>HomeScreen()

      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

