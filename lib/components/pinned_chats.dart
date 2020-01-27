import 'dart:convert';

import "package:flutter/material.dart";

class PinnedChats extends StatefulWidget {
  @override
  _PinnedChatsState createState() => _PinnedChatsState();
}

class _PinnedChatsState extends State<PinnedChats> {
  List itens = [];
  Color primaryColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    if (this.itens.length == 0) {
      DefaultAssetBundle.of(context)
          .loadString("assets/pinned.json")
          .then((stringData) {
        setState(() {
          this.itens = json.decode(stringData);
          this.primaryColor = theme.primaryColor;
        });
      });
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 5.0,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(
              10.0,
              0.0,
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
                    Icons.golf_course,
                  ),
                ),
                Text(
                  "Pinned",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: this.itens.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> element = this.itens[index];
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
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
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            image: DecorationImage(
                              image: AssetImage(
                                element["user_img"],
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              element["user_name"],
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "Maecenas sed elementum augue.",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      Column(
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
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
