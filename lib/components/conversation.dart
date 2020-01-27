import 'dart:convert';

import "package:flutter/material.dart";

class Conversation extends StatelessWidget {
  
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

  Future<List<Widget>> buildList(ThemeData theme, BuildContext context) async {
    List<Widget> currentList = [];
    List pinned = [];
    List chats = [];

    await DefaultAssetBundle.of(context).loadString("assets/pinned.json").then(
      (stringData) {
        pinned = json.decode(stringData);
      },
    );
    await DefaultAssetBundle.of(context).loadString("assets/chats.json").then(
      (stringData) {
        chats = json.decode(stringData);
      },
    );

    currentList.add(this.headerList(text: "Pinned", icon: Icons.golf_course));
    for (Map element in pinned) {
      currentList.add(this.listConversation(element, theme));
    }
    currentList.add(this.headerList(text: "All Chats", icon: Icons.chat_bubble));
    for (Map element in chats) {
      currentList.add(this.listConversation(element, theme));
    }
    return currentList;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(
        top: 15.0,
        left: 5.0,
        right: 5.0,
      ),
      child: FutureBuilder(
        future: this.buildList(theme, context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return ListView(
              children: snapshot.data,
            );
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: theme.primaryColor,
            ),
          );
        },
      ),
    );
  }
}