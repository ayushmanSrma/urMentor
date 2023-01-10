import 'package:flutter/material.dart';
import 'package:ur_mentor/chat_file/Widgets/avatar.dart';
import 'package:ur_mentor/chat_file/Widgets/icon.dart';
import 'package:ur_mentor/chat_file/models/messageData.dart';
import 'package:ur_mentor/chat_file/theme.dart';
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
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
          ),
        ),
        title: _AppBarTitle(
          messageData: messageData,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: IconBorder(
                icon: Icons.camera,
                onTap: () {},
              ),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: const [
           Expanded(
            child: _DemoMessageList(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: _ActionBar(),
          ),
        ],
      )
    );
  }
}

class _DemoMessageList extends StatelessWidget {
  const _DemoMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _DateLable(lable: 'Yesterday'),
        _MessageTile(message: 'Hi! How are you?',
            messageDate:'12.00 PM'),
        _MessageOwnTile(
          message:'Its fine',
          messageDate: '12.02 PM',
        ),
        _MessageTile(
          message:'sure?',
          messageDate: '12.02 PM',
        ),
      ],
    );
  }
}

class _DateLable extends StatelessWidget {
  const _DateLable({Key? key, required this.lable}) : super(key: key);

  final String lable;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Container(
          decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
      ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12),
          child: Text(
            lable,
            style: const TextStyle(
              fontFamily: 'AppleFont',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textFaded
            ),
          ),
        ),
      ) ,
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({Key? key, required this.message, required this.messageDate}) : super(key: key);

  final String message;
  final String messageDate;
  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(_borderRadius),
                  topRight: Radius.circular(_borderRadius),
                  bottomRight: Radius.circular(_borderRadius),
                )
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(messageDate,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                fontFamily: 'AppleFont',
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _MessageOwnTile extends StatelessWidget {
  const _MessageOwnTile({Key? key, required this.message, required this.messageDate}) : super(key: key);

  final String message;
  final String messageDate;
  static const _borderRadius = 26.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_borderRadius),
                    bottomLeft: Radius.circular(_borderRadius),
                    bottomRight: Radius.circular(_borderRadius),
                  )
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                child: Text(message),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(messageDate,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  fontFamily: 'AppleFont',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ActionBar extends StatelessWidget {
  const _ActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 2,
                  color: Theme.of(context).dividerColor,
                )
              )
            ),
            child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(Icons.camera),
            ),
          ),
            const Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 14
                ),
                decoration: InputDecoration(
                  hintText: "Message",
                  border: InputBorder.none,
                ),
              ),
              )
            ),
          Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 24.0,
              ),
            child: IconButton(onPressed:(){},
                icon: Icon(Icons.send_rounded)
            ),
          )
        ],
      ),
    );
  }
}


class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({Key? key, required this.messageData}) : super(key: key);

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
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              messageData.senderName,
              style: const TextStyle(
                  fontFamily: 'AppleFont',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              "Online Now",
              style: TextStyle(
                  fontFamily: "AppleFont",
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            )
          ],
        ))
      ],
    );
  }
}
