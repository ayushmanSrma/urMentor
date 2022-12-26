import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ur_mentor/chat_file/chatHome.dart';
import 'package:ur_mentor/chat_file/chatMain.dart';
import 'package:ur_mentor/pages_file/complete_profile.dart';
import 'menuItem.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuItemsY {
  static const homepage = MenuItemsX('Homepage', Icons.home);
  static const settingPage = MenuItemsX('Setting', Icons.settings);
  static const CompleteProfile =
      MenuItemsX('Complete Your Profile', Icons.account_box);
  static const chatMain = MenuItemsX('Chat', Icons.message_outlined);

  static final all = <MenuItemsX>[
    homepage,
    settingPage,
    CompleteProfile,
    chatMain,
  ];
}

class MenuScreen extends StatelessWidget {
  final MenuItemsX currentItem;
  final ValueChanged<MenuItemsX> onSelectedItem;

  const MenuScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(), //spacer is used to create space between the menu items vertically
            ...MenuItemsY.all.map(buildMenuItems).toList(),
            Spacer(flex: 2)
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(MenuItemsX item) =>
      ListView(shrinkWrap: true, children: <Widget>[
        ListTile(
          selected: currentItem == item,
          minLeadingWidth: 10,
          leading: Icon(item.icon, size: item == currentItem ? 26 : 20), //to change the selected icon size
          title: Text(
            item.title,
            style: TextStyle(fontSize: item == currentItem ? 21 : 16), // to change the selected text size
          ),
          onTap: () => onSelectedItem(item),
        ),
      ]);
}
