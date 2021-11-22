import 'package:flutter/material.dart';
import '../basic/login_screen.dart';
import '../basic/registration_screen.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/screens/roomfinder/postAd.dart';
import 'package:caravan/screens/roomfinder/searchRoom.dart';
import 'package:caravan/screens/basic/chat_screen.dart';

class CarpoolScreen extends StatefulWidget {
  static const String id = 'carpool_screen';

  @override
  _CarpoolScreenState createState() => _CarpoolScreenState();
}

class _CarpoolScreenState extends State<CarpoolScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message_rounded),
        onPressed: () {
          Navigator.pushNamed(context, ChatScreen.id);
        },
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(centerTitle: true, title: Text('Grocery Carpool')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SquaredButton(
              title: 'Search for a driver',
              colour: Colors.white,
              onPressed: () {},
            ),
            SquaredButton(
              title: 'Search for a rider',
              colour: Colors.white,
              onPressed: () {},
            ),
            SizedBox(
              height: 80.0,
            ),
            RoundedButton(
              title: 'Post Carpool',
              colour: Colors.lightBlue,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
