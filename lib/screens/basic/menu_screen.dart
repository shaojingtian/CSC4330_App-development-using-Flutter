import 'package:caravan/components/NavigationBar.dart';
import 'package:caravan/screens/carpool/carpool_screen.dart';
import 'package:caravan/screens/roomfinder/roomfinder_screen.dart';
import 'package:caravan/screens/studygroup/studygroup_screen.dart';
import 'package:caravan/screens/studygroup/create_studyGroup.dart';
import 'package:caravan/screens/studygroup/search_studyGroup.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';

class FrontScreen extends StatefulWidget {
  static const String id = 'front_screen';

  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Connect with your needs ',
        ),
        backgroundColor: Color(0xFF424242),
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, StudyGroupScreen.id);
                      },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/icons_book.png',
                                scale: 3.5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Study Group',
                                style:
                                    new TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ))),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, CarpoolScreen.id);
                      },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/icons_car.png',
                                scale: 4,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Grocery Carpool',
                                style:
                                    new TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ))),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoomfinderScreen.id);
                      },
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/icons_bed.png',
                                scale: 4,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Room/Roomate',
                                style:
                                    new TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ))),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {},
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'images/icons_cocktail.png',
                                scale: 3.5,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Friends',
                                style:
                                    new TextStyle(fontWeight: FontWeight.w600),
                              )
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
