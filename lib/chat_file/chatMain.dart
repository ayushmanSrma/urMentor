import 'package:flutter/material.dart';
import 'package:ur_mentor/chat_file/chatHome.dart';
import 'package:ur_mentor/chat_file/theme.dart';

class chatMain extends StatelessWidget {
  const chatMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: chatHome(), //chatHome screen is being returned
    );
  }
}
