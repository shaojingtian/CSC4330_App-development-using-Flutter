import 'package:firebase_core/firebase_core.dart';
import 'package:caravan/screens/carpool/carpool_screen.dart';
import 'package:flutter/material.dart';
import 'package:caravan/screens/basic/welcome_screen.dart';
import 'package:caravan/screens/basic/login_screen.dart';
import 'package:caravan/screens/basic/registration_screen.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/screens/basic/menu_screen.dart';
import 'package:caravan/screens/roomfinder/roomfinder_screen.dart';
import 'package:caravan/screens/carpool/carpool_screen.dart';
import 'package:caravan/screens/studygroup/studygroup_screen.dart';
import 'package:caravan/screens/roomfinder/postAd.dart';
import 'package:caravan/screens/roomfinder/postAd_withRoom.dart';
import 'package:caravan/screens/roomfinder/postAd_withoutRoom.dart';
import 'package:caravan/screens/roomfinder/searchRoom.dart';
import 'package:caravan/screens/studygroup/studygroup_screen.dart';
import 'package:caravan/screens/studygroup/create_studyGroup.dart';
import 'package:caravan/screens/studygroup/search_studyGroup.dart';
import 'package:caravan/screens/carpool/carpool_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Caravan());
}

class Caravan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        FrontScreen.id: (context) => FrontScreen(),
        RoomfinderScreen.id: (context) => RoomfinderScreen(),
        CarpoolScreen.id: (context) => CarpoolScreen(),
        StudyGroupScreen.id: (context) => StudyGroupScreen(),
        RoomfinderPostAd.id: (context) => RoomfinderPostAd(),
        Postad_withRoom.id: (context) => Postad_withRoom(),
        Postad_withoutRoom.id: (context) => Postad_withoutRoom(),
        SearchRoom.id: (context) => SearchRoom(),
        CarpoolScreen.id: (context) => CarpoolScreen(),
        CreateStudyGroup.id: (context) => CreateStudyGroup(),
        SearchStudyGroups.id: (context) => SearchStudyGroups(),
      },
    );
  }
}
