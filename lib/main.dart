import 'package:flutter/material.dart';
import 'package:ur_mentor/auth_file/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'chat_file/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(), //changed from LoginPage to MainPage where the code to change the page is written
    );
  }
}
