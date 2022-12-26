import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isconfirmPasswordVisible = true;


  @override
  void dispose() {
    _emailController.dispose();
    _passwordcontroller.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  } 

  bool passwordConfirm() {
    if (_passwordcontroller.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  //signUp method
  Future signUp() async {
    if (passwordConfirm()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordcontroller.text.trim());
      } on FirebaseAuthException catch(e){
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
            ));
      }
    }
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          //SafeArea for the text to appear properly on the screen
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                //Hi! Let's sign you up Text
                SizedBox(height: 90), //for the height
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Text(
                    "Hi, Let's sign you up",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        fontFamily: 'AppleFont'),
                  ),
                ),

                //TextField for Email
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.grey[200],
                    //   // border: Border.all(color: Colors.white),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
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
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),

                //Password Textfield
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.grey[200],
                    //   // border: Border.all(color: Colors.white),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: TextField(
                      controller: _passwordcontroller,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: 'Password',
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: isPasswordVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () =>
                              setState(
                                      () =>
                                  isPasswordVisible = !isPasswordVisible),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                      ),
                      obscureText: isPasswordVisible,
                    ),
                  ),
                ),

                //Confirm Password Textfield
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.grey[200],
                    //   // border: Border.all(color: Colors.white),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: TextField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: isconfirmPasswordVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () =>
                              setState(
                                      () =>
                                  isconfirmPasswordVisible = !isconfirmPasswordVisible),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                      ),
                      obscureText: isconfirmPasswordVisible,
                    ),
                  ),
                ),

                //Log in Button
                SizedBox(height: 18),
                ElevatedButton(
                  onPressed: signUp,
                  child: Text(
                    'Verify Email',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'AppleFont',
                        fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10)),
                ),

                //Text I'm a member! Login
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I'm a member! ",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'AppleFont',
                          fontWeight: FontWeight.w700),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'AppleFont',
                            fontWeight: FontWeight.w700,
                            color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
