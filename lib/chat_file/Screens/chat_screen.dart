import 'package:flutter/material.dart';
import 'package:ur_mentor/chat_file/Widgets/avatar.dart';
import 'package:ur_mentor/chat_file/Widgets/icon.dart';
import 'package:ur_mentor/chat_file/models/messageData.dart';
import 'package:ur_mentor/main.dart';

class ChatScreen extends StatelessWidget {
  static Route route(MessageData data) =>
      MaterialPageRoute(builder: (context) => ChatScreen(messageData: data));

  const ChatScreen({Key? key, required this.messageData}) : super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 54,
        leading: Align(
          alignment: Alignment.centerRight,
          child: Center(
            child: IconBackground(
                icon: Icons.arrow_back_ios,
                onTap: (){
                  Navigator.of(context).pop();
                },
            ),
          ),
        ),
        title: _AppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: IconBorder(
              icon: Icons.camera,
              onTap: (){},
            ),
          ),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Center(child: Text('data')),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key,
    required this.messageData}) :
        super(key: key);

  final MessageData messageData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Avatar.small(
          url: messageData.profilePicture,
        ),
        SizedBox(
          width: 12,
        ),
        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text(messageData.senderName,
            style: TextStyle(
              fontFamily: 'AppleFont',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.black
            ),
            ),
            SizedBox(
              height: 2,
            ),
            Text("Online Now",
            style: TextStyle(
              fontFamily: "AppleFont",
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w600
            ),)
          ],
        ))
      ],
    );
  }
}

