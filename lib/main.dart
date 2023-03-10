import 'package:flutter/material.dart';
//import 'package:google/register_screen.dart';
import 'package:google/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
         // theme: ThemeData(
           //   primarySwatch: Colors.deepPurple,
             // colorScheme: ColorScheme.fromSwatch(
               //   brightness: Brightness.light,
                 // primarySwatch: Colors.purple,
                 // accentColor: Colors.purpleAccent,
                 // errorColor: Colors.red,
                 // backgroundColor: Colors.deepPurple)),
        home: const LoginScreen());
  }
}
