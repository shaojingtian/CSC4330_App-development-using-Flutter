import 'package:flutter/material.dart';
import '../basic/login_screen.dart';
import '../basic/registration_screen.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/screens/roomfinder/postAd.dart';
import 'package:caravan/screens/roomfinder/searchRoom.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';
import 'package:caravan/screens/studygroup/search_studyGroup.dart';
import 'package:caravan/screens/studygroup/create_studyGroup.dart';

class StudyGroupScreen extends StatefulWidget {
  static const String id = 'studyGroup_screen';

  @override
  _StudyGroupScreenState createState() => _StudyGroupScreenState();
}

class _StudyGroupScreenState extends State<StudyGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Study Group'),
        backgroundColor: Color(0xFF424242),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SquaredButton(
              title: '  Search a study group',
              icon: Icon(
                Icons.search_sharp,
                color: Colors.black54,
                size: 18,
              ),
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, SearchStudyGroups.id);
              },
            ),
            SquaredButton(
              title: '  Create a study group',
              icon: Icon(
                Icons.create_sharp,
                color: Colors.black54,
                size: 18,
              ),
              colour: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, CreateStudyGroup.id);
              },
            ),
            SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
