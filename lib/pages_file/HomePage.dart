import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: DrawerWidget(),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Congrats message with user email
            Text(
              'Congrats You are signed in as ',
              style: TextStyle(fontSize: 19, fontFamily: 'AppleFont'),
            ),
            Text(
              user.email!,
              style: TextStyle(
                  fontFamily: 'AppleFont',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),

            //sign out button
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => FirebaseAuth.instance.signOut(),
              child: Text(
                'Sign Out',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'AppleFont',
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.black,
      icon: Icon(Icons.menu_rounded),
      onPressed: () {
        //setState(() => isPressed = !isPressed);
        ZoomDrawer.of(context)!.toggle();
      },
    );
  }
}
