import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatsScreen(),
    );
  }
}