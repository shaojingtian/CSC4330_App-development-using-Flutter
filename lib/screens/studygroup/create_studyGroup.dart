import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/constants.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';
import 'package:caravan/screens/roomfinder/room.dart';
import 'package:caravan/screens/basic/menu_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';
import 'package:caravan/screens/studygroup/studyGroup.dart';
import 'package:caravan/screens/studygroup/studygroup_screen.dart';
import 'package:caravan/constants.dart';

class CreateStudyGroup extends StatefulWidget {
  static const String id = 'create_studyGroup';

  @override
  _CreateStudyGroupState createState() => _CreateStudyGroupState();
}

class _CreateStudyGroupState extends State<CreateStudyGroup> {
  final studyGroupDb = FirebaseFirestore.instance;
  bool showSpinner = false;
  StudyGroup studyGroup =
      new StudyGroup('null', 'null', 'null', 'null', 'null');

  TextEditingController dateInput = TextEditingController();

  Widget _buildSubject() {
    String _selected;
    List<Map> subjectList = [
      {'id': '1', 'name': 'Academic Writing'},
      {'id': '2', 'name': 'Business Administration'},
      {'id': '3', 'name': 'Chemistry'},
      {'id': '4', 'name': 'Computer Science'},
      {'id': '5', 'name': 'Economics'},
      {'id': '6', 'name': 'English'},
      {'id': '7', 'name': 'Geography'},
      {'id': '8', 'name': 'Mathematics'},
      {'id': '9', 'name': 'Philosophy'},
      {'id': '10', 'name': 'Physics'},
      {'id': '11', 'name': 'Psychology'},
      {'id': '12', 'name': 'Public Speaking'},
      {'id': '13', 'name': 'Statistics'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Color(0xFF7C4DFF)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField(
                  value: _selected,
                  style: TextStyle(
                      color: Color(0xFF311B92),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  hint: Row(
                    children: [
                      Icon(Icons.school_outlined),
                      Text(
                        '  Select Subject',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.subject = newValue;
                    });
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.subject = newValue;
                    });
                  },
                  items: subjectList.map((subjectItem) {
                    return DropdownMenuItem(
                        value: subjectItem['name'],
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(subjectItem['name']),
                        ));
                  }).toList(),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLevel() {
    String _selected;
    List<Map> levelList = [
      {'id': '1', 'name': 'Level 1'},
      {'id': '2', 'name': 'Level 2'},
      {'id': '3', 'name': 'Level 3'},
      {'id': '4', 'name': 'Level 4'},
      {'id': '5', 'name': 'Level 5'},
      {'id': '6', 'name': 'Level 6'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Color(0xFF7C4DFF)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField(
                  hint: Row(
                    children: [
                      Icon(Icons.grade_outlined),
                      Text(
                        '  Select Level',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  value: _selected,
                  style: TextStyle(
                      color: Color(0xFF311B92),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  onChanged: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.level = newValue;
                    });
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.level = newValue;
                    });
                  },
                  items: levelList.map((levelItem) {
                    return DropdownMenuItem(
                        value: levelItem['name'],
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(levelItem['name']),
                        ));
                  }).toList(),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 9),
      child: TextField(
        controller: dateInput,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7C4DFF), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF7C4DFF), width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            icon: Icon(Icons.calendar_today_outlined,
                size: 22, color: Colors.black87),
            labelText: 'Date:',
            labelStyle: TextStyle(color: Colors.black)),
        readOnly: true,
        onTap: () async {
          DateTime pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
            print(formattedDate);
            setState(() {
              dateInput.text = formattedDate;
              studyGroup.date = formattedDate;
            });
          } else {
            print("Date is not selected.");
          }
        },
      ),
    );
  }

  Widget _buildTime() {
    String _selected;
    List<Map> timeList = [
      {'id': '1', 'name': '9:00 AM'},
      {'id': '2', 'name': '10:00 AM'},
      {'id': '3', 'name': '11:00 AM'},
      {'id': '4', 'name': '12:00 PM'},
      {'id': '5', 'name': '1:00 PM'},
      {'id': '6', 'name': '2:00 PM'},
      {'id': '7', 'name': '3:00 PM'},
      {'id': '8', 'name': '4:00 PM'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Color(0xFF7C4DFF)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField(
                  hint: Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      Text(
                        '  Select Time',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  value: _selected,
                  style: TextStyle(
                      color: Color(0xFF311B92),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  onChanged: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.time = newValue;
                    });
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.time = newValue;
                    });
                  },
                  items: timeList.map((timeItem) {
                    return DropdownMenuItem(
                        value: timeItem['name'],
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(timeItem['name']),
                        ));
                  }).toList(),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBuilding() {
    String _selected;
    List<Map> buildingList = [
      {'id': '1', 'name': 'Patrick F.Taylor Hall'},
      {'id': '2', 'name': 'Middleton Library'},
      {'id': '3', 'name': 'LSU Union'},
      {'id': '4', 'name': 'Lab School'},
      {'id': '5', 'name': 'Law Center'},
      {'id': '6', 'name': 'New Design Building'},
      {'id': '7', 'name': 'Prescott Hall'},
      {'id': '8', 'name': 'Williams Hall'},
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Color(0xFF7C4DFF)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButtonFormField(
                  hint: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        '  Select Location',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  value: _selected,
                  style: TextStyle(
                      color: Color(0xFF311B92),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  onChanged: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.building = newValue;
                    });
                  },
                  onSaved: (newValue) {
                    setState(() {
                      _selected = newValue;
                      studyGroup.building = newValue;
                    });
                  },
                  items: buildingList.map((buildingItem) {
                    return DropdownMenuItem(
                        value: buildingItem['name'],
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(buildingItem['name']),
                        ));
                  }).toList(),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Create a study group'),
          backgroundColor: Color(0xFF7C4DFF)),
      // backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                _buildSubject(),
                SizedBox(
                  height: 24.0,
                ),
                _buildLevel(),
                SizedBox(
                  height: 12.0,
                ),
                _buildDate(),
                SizedBox(
                  height: 12.0,
                ),
                _buildTime(),
                SizedBox(
                  height: 24.0,
                ),
                _buildBuilding(),
                SizedBox(
                  height: 50.0,
                ),
                RoundedButton(
                  title: 'Create',
                  colour: Color(0xFF7C4DFF),
                  onPressed: () async {
                    await studyGroupDb
                        .collection("studyGroups")
                        .add(studyGroup.toJson());
                    Navigator.pushNamed(context, StudyGroupScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
