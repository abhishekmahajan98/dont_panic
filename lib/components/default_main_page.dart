import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class DefaultMainPage extends StatefulWidget {
  @override
  _DefaultMainPageState createState() => _DefaultMainPageState();
}

class _DefaultMainPageState extends State<DefaultMainPage> {
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.9,
          floating: false,
          pinned: true,
          backgroundColor: Colors.indigoAccent,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              top = constraints.biggest.height;
              return FlexibleSpaceBar(
                background: FlareActor(
                  "assets/flares/ResizingHouse.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "Demo Mode",
                ),
                title: top > 80 ? Container() : Text('Balaji Temple,Ahmedabad'),
                centerTitle: true,
              );
            },
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ]),
        )
      ],
    );
  }
}
