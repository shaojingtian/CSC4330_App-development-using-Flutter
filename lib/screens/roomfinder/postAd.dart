import 'package:caravan/screens/roomfinder/postAd_withoutRoom.dart';
import 'package:flutter/material.dart';
import '../basic/login_screen.dart';
import '../basic/registration_screen.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/screens/roomfinder/postAd_withRoom.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';

class RoomfinderPostAd extends StatefulWidget {
  static const String id = 'roomfinderPostAd_screen';

  @override
  _RoomfinderPostAdState createState() => _RoomfinderPostAdState();
}

class _RoomfinderPostAdState extends State<RoomfinderPostAd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post Ad '),
        backgroundColor: Color(0xFF424242),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SquaredButton(
              title: '  I have a room, looking for roommates.',
              icon: Icon(
                Icons.create_sharp,
                color: Colors.black54,
                size: 18,
              ),
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, Postad_withRoom.id);
              },
            ),
            SquaredButton(
              title: '  I am Looking for a room and roommates.',
              icon: Icon(
                Icons.create_sharp,
                color: Colors.black54,
                size: 18,
              ),
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, Postad_withoutRoom.id);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
