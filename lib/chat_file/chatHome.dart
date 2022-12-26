import 'package:flutter/material.dart';
import 'package:ur_mentor/chat_file/Widgets/avatar.dart';
import 'package:ur_mentor/chat_file/helper.dart';
import 'package:ur_mentor/chat_file/pages/messages.dart';
class chatHome extends StatelessWidget {
  const chatHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Text('Messages',style: TextStyle(
            fontFamily: 'AppleFont',
            color: Colors.black),
        ),
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
            color: Colors.black,
            splashColor: Colors.grey[500],
            splashRadius: 20.0,
          )
        ),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Avatar.small(url: Helpers.randomPictureUrl(),),
        )],
      ),
      body: MessagesPages(),
    );
  }
}

