import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp/components/conversation.dart';
import 'package:whatsapp/components/status_bar.dart';

class ChatsScreen extends StatelessWidget {
  void showModal(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          padding: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        image: DecorationImage(
                          image: AssetImage("assets/user.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Your name here!",
                            style: GoogleFonts.istokWeb(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "444-555-1994",
                            style: GoogleFonts.istokWeb(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.userFriends,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Create New Group",
                    style: GoogleFonts.istokWeb(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.commentDots,
                    size: 23.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    "New Transmission",
                    style: GoogleFonts.istokWeb(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.desktop,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Whatsapp Web",
                    style: GoogleFonts.istokWeb(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.heart,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Favorites Messages",
                    style: GoogleFonts.istokWeb(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    FontAwesomeIcons.cog,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Settings",
                    style: GoogleFonts.istokWeb(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget header(Size size, ThemeData theme, BuildContext context) {
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
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => this.showModal(context),
            child: Container(
              width: size.width * 0.40 - 10.0,
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.camera,
                    size: 20.0,
                  ),
                  Icon(
                    FontAwesomeIcons.search,
                    size: 20.0,
                  ),
                  Container(
                    width: 26.0,
                    height: 26.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          100.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/user.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
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
        bottom: false,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                this.header(size, theme, context),
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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 3.0),
                          blurRadius: 4.0,
                        )
                      ],
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
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                        247,
                        255,
                        0,
                        1.0,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 3.0),
                          blurRadius: 4.0,
                        )
                      ],
                    ),
                    child: Icon(
                      FontAwesomeIcons.commentDots,
                      size: 22.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
