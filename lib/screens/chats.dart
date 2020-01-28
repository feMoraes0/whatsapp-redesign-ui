import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
                    style: GoogleFonts.istokWeb(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 11.0,
                  backgroundColor: theme.primaryColor,
                  child: Text(
                    "12",
                    style: GoogleFonts.istokWeb(
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
                Icon(FontAwesomeIcons.camera, size: 20.0,),
                Icon(FontAwesomeIcons.search, size: 20.0,),
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
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                this.header(size, theme),
                StatusBar(),
                Expanded(
                  child: Conversation(),
                ),
              ],
            ),
            Positioned(
              bottom: 15,
              right: 15,
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 25.0,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.white,
                          ),
                          child: Text(
                            "Chats",
                            style: GoogleFonts.istokWeb(
                              color: theme.primaryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 25.0,
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100.0),
                            color: Colors.transparent,
                          ),
                          child: Text(
                            "Calls",
                            style: GoogleFonts.istokWeb(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(247, 255, 0, 1.0,),
                    radius: 30.0,
                    child: Icon(
                      Icons.chat,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
