import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgotPAsswordPage.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordcontroller = TextEditingController();
  bool isPasswordVisible = true;

  //login function
  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordcontroller.text.trim());
    } on FirebaseAuthException catch(e){
      debugPrint(e.toString());
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(e.message.toString(),
              style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'AppleFont',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ));
    }
  }

  //to dispose email and password when not in use
  @override
  void dispose() {
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }


  @override
  void initState() {
    super.initState();
    _emailController.addListener(() => setState(() {}));
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
              //Welcome to urMentor Text
              SizedBox(height: 100), //for the height
              const Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  'Welcome to CORSIT',
                  style: TextStyle(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      fontFamily: 'AppleFont'),
                ),
              ),

              //TextField for Email
              SizedBox(height: 70),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  //decoration: BoxDecoration(
                    //color: Colors.grey[200],
                    // border: Border.all(color: Colors.white),
                    //borderRadius: BorderRadius.circular(20),
                  //),
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
                  //    border: Border.all(color: Colors.white),
                  //   borderRadius: BorderRadius.circular(10),
                  //),
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
                        onPressed: () => setState(
                            () => isPasswordVisible = !isPasswordVisible),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                    ),
                    obscureText: isPasswordVisible,
                  ),
                ),
              ),

              //Forgot password
              Padding(
                padding: EdgeInsets.fromLTRB(0,8,40,0),
                child: Row
                  (mainAxisAlignment: MainAxisAlignment.end,
                   children:[GestureDetector(
                     onTap:(){
                       Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context){
                         return ForgotPassword();
              },
              )
                       );
              },

                     child: const Text('Forgot Password?',style: TextStyle(
                      fontFamily: 'AppleFont',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                       color: Colors.blue
                  ),
                  ),
                   ),
          ]
                ),
              ),

              //Log in Button
              SizedBox(height: 14),
              ElevatedButton(
                onPressed: logIn,
                child: Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'AppleFont',
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.fromLTRB(22, 10, 22, 10)),
              ),

              //Text not a member? register now
              SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'AppleFont',
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      'Register Now',
                      style: TextStyle(
                          fontSize: 16,
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
