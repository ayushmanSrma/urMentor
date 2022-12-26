import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages_file/VerifyEmail.dart';
import 'auth_page.dart';
//this page is used to check whether we logged in or not
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream:FirebaseAuth.instance.authStateChanges(), //check the changes in auth state
          builder: (context,snapshot){//snapshot is for checking the user
            if(snapshot.hasData) { //hasData means there is a user
              return VerifyEmail(); //if you register it would redirect you to verification page after that
                                    // it would return to the homepage after successful login
            }else{
              return AuthPage();//if login is not successful then it would return to login page
            }                   //login page was changed to AuthPage where it would first show login page
          }                     //or you can register new user
      ),
    );
  }
}
