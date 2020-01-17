import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dont_panic/components/side_drawer.dart';
import 'package:dont_panic/pages/defaulthomepage.dart';
import 'package:dont_panic/pages/earthquake_page.dart';
import 'package:dont_panic/pages/home.dart';
import 'package:dont_panic/pages/lost_and_found.dart';
import 'package:dont_panic/pages/radio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer advancedPlayer;
  bool playAlarm=false;
  @override
  initState() {
    super.initState();
  }
  Future loadMusic() async {
    advancedPlayer = await AudioCache().play('audio/Temp.mp3',stayAwake: false);
  }

  final List<Widget> _disasterpages = [
   DefaultHomepage(),
    EarthquakePage(),

  ];
   int _selectedIndex = 0;
  final List<String> _pageTitles = [
    'Home',
    'Radio',
    'Lost and found',
  ];
  final List<Widget> _pages = [
    Home(),
    Radiochat(),
    LostAndFound(),
  ];
  BottomNavigationBarItem _buildNavigationItem(
      int index, IconData iconData, String text) {
    return BottomNavigationBarItem(
      icon: Icon(
        iconData,
        color: Colors.black,
      ),
      activeIcon: Icon(
        iconData,
        color: Colors.red,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index
              ? Colors.red
              : Colors.black,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dont Panic"),
        centerTitle: true,
        actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () async {
                  setState(() {
                    playAlarm=!playAlarm;
                  });
                  if(!playAlarm)
                  {
                    advancedPlayer.stop();
                  }
                  else
                  {
                    advancedPlayer=await AudioCache().loop('audio/Temp.mp3');
                  }
                },
                child: Icon(
                  playAlarm==true?FontAwesomeIcons.solidBellSlash:FontAwesomeIcons.solidBell,
                ),
                ),
            ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.call,),
      ),
      bottomNavigationBar:  BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _buildNavigationItem(0, FontAwesomeIcons.list, _pageTitles[0]),
            _buildNavigationItem(1, FontAwesomeIcons.checkSquare, _pageTitles[1]),
            _buildNavigationItem(2, FontAwesomeIcons.clipboardCheck, _pageTitles[2]),
            
          ],
        ),
      drawer: SideDrawer(),
      body: _pages[_selectedIndex],

    );
  }
}
