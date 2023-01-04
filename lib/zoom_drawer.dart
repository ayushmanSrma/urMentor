import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ur_mentor/chat_file/Screens/chatHome.dart';
import 'package:ur_mentor/chat_file/chatMain.dart';
import 'package:ur_mentor/pages_file/HomePage.dart';
import 'package:ur_mentor/pages_file/complete_profile.dart';
import 'package:ur_mentor/pages_file/menuItem.dart';
import 'package:ur_mentor/pages_file/menuScreen.dart';
import 'package:ur_mentor/pages_file/setting_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  MenuItemsX currentItem = MenuItemsY.homepage;

  @override
  Widget build(BuildContext context) {
    Widget getScreen() {
      switch (currentItem) {
        case MenuItemsY.homepage:
          return HomePage();
        case MenuItemsY.CompleteProfile:
          return CompleteProfile();
        case MenuItemsY.chatMain:
          return chatMain();
        default:
          return settingPage();
      }
    }

    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        }
      ),
      mainScreen: getScreen(),
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.blue.shade800,
      angle: 0.0,
      borderRadius: 30.0,
      menuBackgroundColor: Colors.lightBlue.shade200,
      duration: const Duration(milliseconds: 400),
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}
