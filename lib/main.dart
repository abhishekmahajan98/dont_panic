import 'package:dont_panic/home_page.dart';
import 'package:dont_panic/loginpage.dart';
import 'package:dont_panic/registration.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/registration_page':(context)=>signUp(),
        '/homepage':(context)=>HomePage(),

      },
    );
  }
}

