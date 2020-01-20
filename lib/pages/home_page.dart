import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dont_panic/components/chat_page.dart';
import 'package:dont_panic/components/helpline_numbers_page.dart';
import 'package:dont_panic/components/lost_and_found_page.dart';
import 'package:dont_panic/components/main_page.dart';
import 'package:dont_panic/components/radio_page.dart';
import 'package:dont_panic/components/side_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer advancedPlayer;
  bool playAlarm = false;
  @override
  initState() {
    super.initState();
  }

  Future loadMusic() async {
    advancedPlayer =
        await AudioCache().play('audio/Temp.mp3', stayAwake: false);
  }

  int _selectedIndex = 0;
  final List<String> _pageTitles = [
    'Home',
    'Radio',
    'Lost and found',
    'Helpline Numbers',
    'Help Chat',
  ];
  final List<Widget> _pages = [
    MainPage(),
    Radiochat(),
    LostAndFound(),
    HelpNumbersPage(),
    ChatPage(),
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
        color: Colors.indigoAccent,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _selectedIndex == index ? Colors.indigoAccent : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Dont Panic"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () async {
                setState(() {
                  playAlarm = !playAlarm;
                });
                if (!playAlarm) {
                  advancedPlayer.stop();
                } else {
                  advancedPlayer = await AudioCache().loop('audio/Temp.mp3');
                }
              },
              child: Icon(
                playAlarm == true
                    ? FontAwesomeIcons.solidBellSlash
                    : FontAwesomeIcons.solidBell,
              ),
            ),
          ),
        ],
      ),*/
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.call,
        ),
      ),*/
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          _buildNavigationItem(0, FontAwesomeIcons.list, _pageTitles[0]),
          _buildNavigationItem(
              1, FontAwesomeIcons.broadcastTower, _pageTitles[1]),
          _buildNavigationItem(2, FontAwesomeIcons.book, _pageTitles[2]),
          _buildNavigationItem(3, FontAwesomeIcons.firstAid, _pageTitles[3]),
          _buildNavigationItem(4, FontAwesomeIcons.whatsapp, _pageTitles[4]),
        ],
      ),
      drawer: SideDrawer(),
      body: _pages[_selectedIndex],
    );
  }
}
