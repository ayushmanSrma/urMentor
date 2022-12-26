import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ur_mentor/pages_file/HomePage.dart';
import 'package:ur_mentor/zoom_drawer.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final user = FirebaseAuth.instance.currentUser!;
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    //user needs to be created before
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    //to change isEmailVerified to true when clicked on the link
    if (!isEmailVerified) {
      sendEmailVerification();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    };
  }
  //to dispose timer
  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  //email checking verification function
  Future checkEmailVerified() async {
    //call after email verification
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!
          .emailVerified; //after email verification isEmailVerified is
    });                   //updated to true hence it is redirected to homepage
  }

  //sending verification email function
  Future sendEmailVerification() async {
    try {
      setState(() =>
      canResendEmail = false); //Initially resend email button will not work
      await Future.delayed(Duration(seconds: 10)); //delays 10 second
      setState(() =>
      canResendEmail = true); //after 10 second resend email button is active
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    }on FirebaseAuthException catch(e){
      debugPrint(e.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(e.message.toString(),
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'AppleFont',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? DrawerPage()
      : Scaffold(
          backgroundColor: Colors.grey[300],
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Click on link message
                  SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 35,0,0),
                    child: Text('Please click on the link sended to',
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'AppleFont'),
                    ),
                  ),
                  Text(user.email!,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontFamily: 'AppleFont'),
                  ),
                  SizedBox(height: 13),
                  Text('Also check in your spam folder',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                        fontFamily: 'AppleFont'),
                  ),

                  //Resend Email button
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: canResendEmail ? sendEmailVerification : null,
                    child: Text("Resend Email",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontFamily: 'AppleFont'),),
                  ),

                  //Cancel button to sign out
                  TextButton(
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50)),
                    onPressed: () => FirebaseAuth.instance.signOut(),
                  ),
                ],
              ),
            ),
          ),
        );
}
