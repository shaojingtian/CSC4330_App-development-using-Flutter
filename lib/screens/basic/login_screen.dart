// import 'package:flutter/material.dart';
// import 'package:caravan/components/rounded_button.dart';
// import 'package:caravan/constants.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'menu_screen.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
//
// class LoginScreen extends StatefulWidget {
//   static const String id = 'login_screen';
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool showSpinner = false;
//   final _auth = FirebaseAuth.instance;
//   String email;
//   String password;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       backgroundColor: cBackgroundColor,
//       body: ModalProgressHUD(
//         inAsyncCall: showSpinner,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 100,
//                   backgroundImage: AssetImage('images/caravan.png.jpeg'),
//                 ),
//                 SizedBox(
//                   height: 48.0,
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     email = value;
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your email'),
//                 ),
//                 SizedBox(
//                   height: 8.0,
//                 ),
//                 TextField(
//                   obscureText: true,
//                   textAlign: TextAlign.center,
//                   onChanged: (value) {
//                     password = value;
//                   },
//                   decoration: kTextFieldDecoration.copyWith(
//                       hintText: 'Enter your password'),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 RoundedButton(
//                   title: 'Log In',
//                   colour: Color(0xFF7C4DFF),
//                   onPressed: () async {
//                     setState(() {
//                       showSpinner = true;
//                     });
//                     try {
//                       final user = await _auth.signInWithEmailAndPassword(
//                           email: email, password: password);
//                       if (user != null) {
//                         Navigator.pushNamed(context, FrontScreen.id);
//                       }
//
//                       setState(() {
//                         showSpinner = false;
//                       });
//                     } catch (e) {
//                       print(e);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
