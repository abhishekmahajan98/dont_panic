import 'dart:async';
import 'package:dont_panic/components/default_main_page.dart';
import 'package:dont_panic/components/earthquake_page.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Widget> _disasterpages = [
   DefaultMainPage(),
    EarthquakePage(),

  ];
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        _disasterpages[_selectedIndex],
    );
  }
}