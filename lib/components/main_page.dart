import 'package:dont_panic/components/default_main_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List calamities = [
    DefaultMainPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return calamities[0];
  }
}
