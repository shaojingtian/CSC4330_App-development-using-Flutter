import 'package:flutter/material.dart';
import 'package:caravan/components/rounded_button.dart';
import 'package:caravan/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'menu_screen.dart';
import 'package:caravan/screens/basic/registration_screen.dart';
import 'package:caravan/components/NavigationBar.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF424242),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/Caravanlogo_2.png',
                scale: 4,
              ),
              Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your email'),
                          ),
                          TextField(
                            obscureText: true,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your password'),
                          ),
                          RoundedButton(
                            title: 'Log In',
                            colour: Color(0xFF7C4DFF),
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final user =
                                    await _auth.signInWithEmailAndPassword(
                                        email: email, password: password);
                                if (user != null) {
                                  Navigator.pushNamed(context, FrontScreen.id);
                                }

                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            },
                          ),
                        ]),
                  )),
              SizedBox(
                height: 24.0,
              ),
              Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle_sharp,
                                    color: Color(0xFF7C4DFF),
                                    size: 20,
                                  ),
                                  Text(
                                    ' Find a study group',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle_sharp,
                                    color: Color(0xFF7C4DFF),
                                    size: 20,
                                  ),
                                  Text(
                                    ' Find a place to live',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle_sharp,
                                    color: Color(0xFF7C4DFF),
                                    size: 20,
                                  ),
                                  Text(
                                    ' Find a carpool',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle_sharp,
                                    color: Color(0xFF7C4DFF),
                                    size: 20,
                                  ),
                                  Text(
                                    ' Find friends',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RoundedButton(
                            title: 'Create Account',
                            colour: Color(0xFF7C4DFF),
                            onPressed: () async {
                              setState(() {
                                Navigator.pushNamed(
                                    context, RegistrationScreen.id);
                              });
                            },
                          ),
                        ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
