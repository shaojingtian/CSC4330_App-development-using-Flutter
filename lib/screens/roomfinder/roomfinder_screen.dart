import 'package:flutter/material.dart';
import '../basic/login_screen.dart';
import '../basic/registration_screen.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/screens/roomfinder/postAd.dart';
import 'package:caravan/screens/roomfinder/searchRoom.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';

class RoomfinderScreen extends StatefulWidget {
  static const String id = 'roomfinder_screen';

  @override
  _RoomfinderScreenState createState() => _RoomfinderScreenState();
}

class _RoomfinderScreenState extends State<RoomfinderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Room/Roommate'),
        backgroundColor: Color(0xFF424242),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SquaredButton(
              title: '  Search for a room',
              icon: Icon(
                Icons.search_sharp,
                color: Colors.black54,
                size: 18,
              ),
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, SearchRoom.id);
              },
            ),
            SquaredButton(
              title: '  Search for a roommate',
              icon: Icon(
                Icons.search_sharp,
                color: Colors.black54,
                size: 18,
              ),
              colour: Colors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 80.0,
            ),
            RoundedButton(
              title: 'Post Ad',
              colour: Color(0xFF7C4DFF),
              onPressed: () {
                Navigator.pushNamed(context, RoomfinderPostAd.id);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
