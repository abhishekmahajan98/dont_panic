import 'package:dont_panic/pages/home_page.dart';
import 'package:dont_panic/pages/registration.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => RegistrationPage(),
        '/home_page': (context) => HomePage(),
      },
    );
  }
}
