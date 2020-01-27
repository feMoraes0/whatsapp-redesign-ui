import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(42, 198, 144, 1.0),
      ),
      home: ChatsScreen(),
    );
  }
}