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
import 'package:caravan/screens/roomfinder/person.dart';
import 'package:caravan/screens/basic/chat_screen.dart';

class Postad_withoutRoom extends StatefulWidget {
  static const String id = 'postad_withoutroom';

  @override
  _Postad_withoutRoomState createState() => _Postad_withoutRoomState();
}

class _Postad_withoutRoomState extends State<Postad_withoutRoom> {
  final personDb = FirebaseFirestore.instance;
  bool showSpinner = false;
  Person person =
      new Person('null', 'null', 20, 'null', 'null', 'null', false, false);

  TextEditingController dateInput = TextEditingController();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(icon: Icon(Icons.person), labelText: 'Name:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }
      },
      onChanged: (String value) {
        person.name = value;
      },
    );
  }

  Widget _buildGender() {
    return Theme(
      data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.grey, disabledColor: Colors.blue),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text(
              'Gender:',
            )),
          ),
          Row(children: <Widget>[
            Icon(
              Icons.wc,
              color: Colors.grey,
            ),
            Radio<String>(
                value: 'male',
                groupValue: person.gender,
                onChanged: (String value) {
                  setState(() {
                    person.gender = value;
                  });
                }),
            Text('Male'),
            Radio<String>(
                value: 'female',
                groupValue: person.gender,
                onChanged: (String value) {
                  setState(() {
                    person.gender = value;
                  });
                }),
            Text('Female'),
            Radio<String>(
                value: 'other',
                groupValue: person.gender,
                onChanged: (String value) {
                  setState(() {
                    person.gender = value;
                  });
                }),
            Text('Other'),
          ]),
        ],
      ),
    );
  }

  Widget _buildAge() {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                child: Text(
              'Age:',
            )),
          ),
          Text(
            person.age.toString(),
          ),
        ],
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        Icon(
          Icons.cake,
          color: Colors.grey,
        ),
        Container(
          width: 300,
          child: CupertinoSlider(
              value: person.age.toDouble(),
              min: 0,
              max: 100,
              activeColor: Colors.blue,
              // inactiveColor: Colors.grey,
              onChanged: (var value) {
                setState(() {
                  person.age = value.toInt();
                });
              }),
        )
      ])
    ]);
  }

  Widget _buildZipcode() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.location_on_rounded), labelText: 'Zipcode:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Zipcode is Required';
        }
      },
      onChanged: (String value) {
        person.zipcode = value;
      },
    );
  }

  Widget _buildBudget() {
    return TextFormField(
      decoration:
          InputDecoration(icon: Icon(Icons.money), labelText: 'Budget:'),
      inputFormatters: [CurrencyTextInputFormatter()],
      keyboardType: TextInputType.number,
      onChanged: (var value) {
        person.budget = value;
      },
    );
  }

  Widget _buildAvailableDate() {
    return TextFormField(
      controller: dateInput,
      decoration: InputDecoration(
          icon: Icon(Icons.calendar_today), labelText: 'Available since:'),
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
            person.availableDate = formattedDate;
          });
        } else {
          print("Date is not selected.");
        }
      },
    );
  }

  Widget _buildPetOwner() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.pets,
              color: Colors.grey,
            ),
            Text('Pet owner?'),
          ],
        ),
        Checkbox(
          checkColor: Colors.blue,
          activeColor: Colors.grey,
          value: person.petOwner,
          onChanged: (bool value) {
            setState(() {
              person.petOwner = value;
            });
          },
        )
      ],
    );
  }

  Widget _buildSmoker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.smoking_rooms_outlined,
              color: Colors.grey,
            ),
            Text('Smoker?'),
          ],
        ),
        Checkbox(
          checkColor: Colors.blue,
          activeColor: Colors.grey,
          value: person.smoker,
          onChanged: (bool value) {
            setState(() {
              person.smoker = value;
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Fill out about me'),
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
                  height: 5.0,
                ),
                _buildName(),
                SizedBox(
                  height: 18.0,
                ),
                _buildGender(),
                SizedBox(
                  height: 12.0,
                ),
                _buildAge(),
                _buildZipcode(),
                SizedBox(
                  height: 8.0,
                ),
                _buildBudget(),
                SizedBox(
                  height: 8.0,
                ),
                _buildAvailableDate(),
                SizedBox(
                  height: 8.0,
                ),
                _buildPetOwner(),
                _buildSmoker(),
                RoundedButton(
                  title: 'Submit',
                  colour: Color(0xFF7C4DFF),
                  onPressed: () async {
                    await personDb.collection("persons").add(person.toJson());
                    Navigator.pushNamed(context, FrontScreen.id);
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
