import 'dart:convert';

import "package:flutter/material.dart";

class StatusBar extends StatefulWidget {
 
  @override
  _StatusBarState createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {

  List status = [];

  Widget add({@required color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 58.0,
            height: 58.0,
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "Add",
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget userStatus({
    @required String userName,
    @required String userImg,
    @required String statusImg,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 58.0,
                height: 58.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: AssetImage(statusImg),
                    fit: BoxFit.cover,
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
                    border: Border.all(color: Colors.white, width: 3.0,),
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
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {

    if(this.status.length == 0) {
      DefaultAssetBundle.of(context).loadString("assets/status.json").then((stringData) {
        setState(() {
          this.status = json.decode(stringData);
        });
      });
    }

    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: size.width,
        height: 108.0,
        child: ListView.builder(
          itemCount: this.status.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            if (position == 0) {
              return this.add(
                color: theme.primaryColor,
              );
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
