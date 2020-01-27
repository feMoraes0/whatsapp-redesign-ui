import "package:flutter/material.dart";
import 'package:whatsapp/components/conversation.dart';
import 'package:whatsapp/components/status_bar.dart';

class ChatsScreen extends StatelessWidget {
  Widget header(Size size, ThemeData theme) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: size.width * 0.60 - 10.0,
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: theme.primaryColor,
                  child: Text(
                    "1",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width * 0.40 - 10.0,
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.camera_alt),
                Icon(Icons.search),
                Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        100.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          this.header(size, theme),
          StatusBar(),
          Expanded(
            child: Conversation(),
          ),
        ],
      ),
    ));
  }
}
