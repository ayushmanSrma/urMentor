import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset(BuildContext context) async {
    //You have to pass BuildContext to passwordReset
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                //DialogBox for succesful reset link
                content: Text(
                  "Password reset link has sent.\nClick on the link to reset and login again.",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'AppleFont',
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
              ));
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: Text(
                  e.message.toString(),
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'AppleFont',
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          //Back IconButton
          Padding(
            padding: const EdgeInsets.fromLTRB(300, 30, 0, 0),
            child: IconButton(
              onPressed: () => Navigator.pop(context, false),
              icon: const Icon(Icons.exit_to_app_rounded),
              iconSize: 33.0,
              highlightColor: Colors.blue,
              splashRadius: 30,
            ),
          ),

          //Enter email text
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
            child: Text(
              'Enter the email to receive reset password link',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'AppleFont',
              ),
              textAlign: TextAlign.center,
            ),
          ),

          //email TextField
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Container(
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'name@example.com',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                  suffixIcon: _emailController.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => _emailController.clear(),
                        ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
              ),
            ),
          ),

          //Reset Button
          ElevatedButton(
            onPressed: () => passwordReset(context), // ADD THIS
            child: Text(
              'Reset Password',
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'AppleFont',
                  fontWeight: FontWeight.w600),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.fromLTRB(20, 8, 20, 8)),
          ),
        ],
      ),
    );
  }
}
