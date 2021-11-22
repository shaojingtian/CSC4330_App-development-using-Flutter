import 'package:caravan/screens/roomfinder/DataController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/constants.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:caravan/screens/roomfinder/room.dart';
import 'package:caravan/screens/basic/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';

class SearchRoom extends StatefulWidget {
  static const String id = 'search_room';
  @override
  _SearchRoomState createState() => _SearchRoomState();
}

class _SearchRoomState extends State<SearchRoom> {
  final TextEditingController searchController = TextEditingController();
  QuerySnapshot snapshotData;
  bool isExcecuted = false;

  @override
  Widget build(BuildContext context) {
    Widget searchedData() {
      return ListView.builder(
          itemCount: snapshotData.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('images/my_profile.jpeg'),
                  ),
                ),
              ),
              title: Text(
                snapshotData.docs[index].get('address'),
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
              subtitle: Text(
                snapshotData.docs[index].get('rent'),
                style: TextStyle(color: Colors.black, fontSize: 18.0),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF7C4DFF),
        actions: [
          GetBuilder<DataController>(
              init: DataController(),
              builder: (val) {
                return IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    val.queryData(searchController.text).then((value) {
                      snapshotData = value;
                      setState(() {
                        isExcecuted = true;
                      });
                    });
                  },
                );
              })
        ],
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: 'Search by zip code',
              hintStyle: TextStyle(color: Colors.white)),
          controller: searchController,
        ),
        // backgroundColor: Colors.black,
      ),
      body: isExcecuted
          ? searchedData()
          : Container(
              child: Center(
              child: Text('Search any rooms'),
            )),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
