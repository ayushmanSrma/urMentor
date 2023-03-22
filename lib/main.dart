import 'package:flutter/material.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';
import 'package:ur_mentor/auth_file/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'chat_file/app.dart';
import 'chat_file/theme.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final client = StreamChatClient(streamkey);
  await Firebase.initializeApp();
  runApp(MyApp(
    client: client,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.client}) : super(key: key);
   final StreamChatClient client ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(), //changed from LoginPage to MainPage where the code to change the page is written
      builder: (context, child) {
        return StreamChatCore(client: client, child: child!);
      },
    );
  }
}


//builder: (context, child) {
//         return StreamChatCore(client: client, child: !child);
//       },