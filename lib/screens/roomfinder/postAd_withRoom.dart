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
import 'package:caravan/screens/basic/chat_screen.dart';
import 'package:caravan/components/NavigationBar.dart';

class Postad_withRoom extends StatefulWidget {
  static const String id = 'postad_withroom';

  @override
  _Postad_withRoomState createState() => _Postad_withRoomState();
}

class _Postad_withRoomState extends State<Postad_withRoom> {
  final roomDb = FirebaseFirestore.instance;
  bool showSpinner = false;
  Room room = new Room('null', 'null', 'null', 'null', 'null', 'null');

  TextEditingController dateInput = TextEditingController();

  Widget _buildRoomType() {
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
              'Room type:',
            )),
          ),
          Row(children: <Widget>[
            Icon(
              Icons.house,
              color: Colors.grey,
            ),
            Radio<String>(
                value: 'apartment',
                groupValue: room.roomType,
                onChanged: (String value) {
                  setState(() {
                    room.roomType = value;
                  });
                }),
            Text('Apartment'),
            Radio<String>(
                value: 'house',
                groupValue: room.roomType,
                onChanged: (String value) {
                  setState(() {
                    room.roomType = value;
                  });
                }),
            Text('House'),
            Radio<String>(
                value: 'other',
                groupValue: room.roomType,
                onChanged: (String value) {
                  setState(() {
                    room.roomType = value;
                  });
                }),
            Text('Other'),
          ]),
        ],
      ),
    );
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
        room.zipcode = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration:
          InputDecoration(icon: Icon(Icons.apartment), labelText: 'Address:'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Address is Required';
        }
      },
      onChanged: (String value) {
        room.address = value;
      },
    );
  }

  Widget _buildRent() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(Icons.monetization_on_rounded), labelText: 'Rent:'),
      inputFormatters: [CurrencyTextInputFormatter()],
      keyboardType: TextInputType.number,
      onChanged: (var value) {
        room.rent = value;
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
            room.availableDate = formattedDate;
          });
        } else {
          print("Date is not selected.");
        }
      },
    );
  }

  Widget _buildPreferredGender() {
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
              'Preferred Gender:',
            )),
          ),
          Row(children: <Widget>[
            Icon(
              Icons.wc,
              color: Colors.grey,
            ),
            Radio<String>(
                value: 'male',
                groupValue: room.preferredGender,
                onChanged: (String value) {
                  setState(() {
                    room.preferredGender = value;
                  });
                }),
            Text('Male'),
            Radio<String>(
                value: 'female',
                groupValue: room.preferredGender,
                onChanged: (String value) {
                  setState(() {
                    room.preferredGender = value;
                  });
                }),
            Text('Female'),
            Radio<String>(
                value: 'other',
                groupValue: room.preferredGender,
                onChanged: (String value) {
                  setState(() {
                    room.preferredGender = value;
                  });
                }),
            Text('Other'),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('Fill out your room info'),
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
                _buildRoomType(),
                _buildZipcode(),
                SizedBox(
                  height: 8.0,
                ),
                _buildAddress(),
                SizedBox(
                  height: 8.0,
                ),
                _buildRent(),
                SizedBox(
                  height: 8.0,
                ),
                _buildAvailableDate(),
                SizedBox(
                  height: 38.0,
                ),
                _buildPreferredGender(),
                SizedBox(
                  height: 18.0,
                ),
                RoundedButton(
                  title: 'Submit',
                  colour: Color(0xFF7C4DFF),
                  onPressed: () async {
                    await roomDb.collection("rooms").add(room.toJson());
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
