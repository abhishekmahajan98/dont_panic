import 'package:dont_panic/defaulthomepage.dart';
import 'package:dont_panic/earthquake_page.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
   DefaultHomepage(),
    EarthquakePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[1],

    );
  }
}
