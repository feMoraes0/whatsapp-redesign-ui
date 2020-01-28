import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusBar extends StatefulWidget {
  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  List status = [];
  Color primaryColor;

  Widget add() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 62.0,
            height: 62.0,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: this.primaryColor,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Icon(
              FontAwesomeIcons.plus,
              size: 18.0,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "Add",
              style: GoogleFonts.istokWeb(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userStatus({
    @required String userName,
    @required String userImg,
    @required List statusImg,
  }) {
    double radius = 195.0;
    double quantStatus = (radius - (10 * (statusImg.length - 1))) / statusImg.length;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 62.0,
                width: 62.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                child: DottedBorder(
                  borderType: BorderType.Circle,
                  color: this.primaryColor,
                  strokeWidth: 3.0,
                  dashPattern: [quantStatus, 5],
                  child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                      image: DecorationImage(
                        image: AssetImage(statusImg[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 28.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 3.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage(userImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              userName,
              style: GoogleFonts.istokWeb(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    if (this.status.length == 0) {
      DefaultAssetBundle.of(context)
          .loadString("assets/status.json")
          .then((stringData) {
        setState(() {
          this.status = json.decode(stringData);
          this.primaryColor = theme.primaryColor;
        });
      });
    }

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: size.width,
        height: 117.0,
        child: ListView.builder(
          itemCount: this.status.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            if (position == 0) {
              return this.add();
            } else {
              Map<String, dynamic> item = this.status[position - 1];
              return this.userStatus(
                userName: item["name_user"],
                userImg: item["img_user"],
                statusImg: item["img_status"],
              );
            }
          },
        ));
  }
}
