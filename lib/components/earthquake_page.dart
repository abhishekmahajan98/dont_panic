import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:marquee/marquee.dart';
    class EarthquakePage extends StatefulWidget {
      @override
      _EarthquakePageState createState() => _EarthquakePageState();
    }

    class _EarthquakePageState extends State<EarthquakePage> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title:Text('Earthquake'),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height / 2),
                width: 3*(MediaQuery.of(context).size.height / 2),
                child: FlareActor("assets/images/flare/SuccessCheck.flr",
                  alignment:Alignment.center,
                  fit:BoxFit.contain,
                  animation:"Untitled",
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 12,
                width: MediaQuery.of(context).size.width,

                alignment: Alignment.center,
                child: Marquee(
                  text: 'Some sample text that takes some space.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                  scrollAxis: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  blankSpace: 20.0,
                  velocity: 100.0,
                  pauseAfterRound: Duration(seconds: 1),
                  startPadding: 10.0,
                  accelerationDuration: Duration(seconds: 1),
                  accelerationCurve: Curves.linear,
                  decelerationDuration: Duration(milliseconds: 500),
                  decelerationCurve: Curves.easeOut,
                ),
              ),



              Container(
                child: Text('Things to carry'),

              ),

            ],
          ),
        ),


        );
      }
    }

