import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:ur_mentor/chat_file/Screens/chatHome.dart';
import 'package:ur_mentor/chat_file/Screens/select_user_screen.dart';
import 'package:ur_mentor/chat_file/theme.dart';

class chatMain extends StatelessWidget {
  const chatMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectUserScreen(), //chatHome screen is being returned
    );
  }
}
