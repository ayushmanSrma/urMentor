import 'package:flutter/material.dart';
import 'package:ur_mentor/pages_file/LoginPage.dart';

import '../pages_file/RegisterPage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
    bool showLoginPage = true;

    void toggleScreen(){
      setState(() {
        showLoginPage = !showLoginPage; // it change the state of showLoginPage from true to false or vice versa
      });        //so that depending on which page you are either it will login page or it will show register page
}
  @override
  Widget build(BuildContext context) {
   if(showLoginPage){
     return LoginPage(showRegisterPage: toggleScreen); // initially showLoginPage is true, so it wil show login page initially
   }else{                                              // after calling the function the state of login page changes to false
     return RegisterPage(showLoginPage: toggleScreen ); //afterwards if it is not true then it goes to the register page
   }                                                   // after calling the function the state of login page changes to true
  }
}
