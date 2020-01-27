import 'dart:convert';

import "package:flutter/material.dart";

class Conversation extends StatefulWidget {
  @override
  _ConversationState createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  List pinned = [];
  List chats = [];
  Color primaryColor;

  Widget headerList({@required String text, @required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        10.0,
        10.0,
        10.0,
        15.0,
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Icon(
              icon,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget listConversation(Map element, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(90.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 52,
                height: 52,
                margin: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: AssetImage(
                      element["user_img"],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              (element["unread"] != "0")
                  ? Positioned(
                      top: -2,
                      right: -2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          border: Border.all(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 12.0,
                          backgroundColor: theme.primaryColor,
                          child: Text(
                            element["unread"],
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: 55.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    element["user_name"],
                    style: TextStyle(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600,
                      color: (element["unread"] != "0")
                          ? theme.primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                Text(
                  "Maecenas sed elementum augue.",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: (element["unread"] != "0")
                        ? FontWeight.w700
                        : FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 55.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    element["date"],
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  Icons.golf_course,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  Future<List<Widget>> buildList(ThemeData theme) async {
    List<Widget> currentList = [];
    currentList.add(this.headerList(text: "Pinned", icon: Icons.golf_course));
    for (Map element in this.pinned) {
      currentList.add(this.listConversation(element, theme));
    }
    currentList.add(this.headerList(text: "AllChats", icon: Icons.chat_bubble));
    for (Map element in this.chats) {
      currentList.add(this.listConversation(element, theme));
    }
    return currentList;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    if (this.pinned.length == 0) {
      DefaultAssetBundle.of(context)
          .loadString("assets/pinned.json")
          .then((stringData) {
        setState(() {
          this.pinned = json.decode(stringData);
        });
      });
    }

    if (this.chats.length == 0) {
      DefaultAssetBundle.of(context)
          .loadString("assets/chats.json")
          .then((stringData) {
        setState(() {
          this.chats = json.decode(stringData);
        });
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 5.0,
      ),
      child: FutureBuilder(
        future: this.buildList(theme),
        builder: (context, snapshot) {
          return ListView(
            children: snapshot.data,
          );
        },
      )
    );
  }
}
