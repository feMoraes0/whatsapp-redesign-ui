import "package:flutter/material.dart";

class StatusBar extends StatelessWidget {
  final List status = [
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
    {
      "name_user": "Pedro",
      "img_user":
          "https://assets3.thrillist.com/v1/image/2817820/size/tmg-article_tall;jpeg_quality=20.jpg",
      "img_status":
          "https://img.huffingtonpost.com/asset/59e8f7b71500009e0d7467cc.jpeg",
    },
  ];

  Widget add({@required color}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
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
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(100.0),
                  image: DecorationImage(
                    image: NetworkImage(statusImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 25.0,
                  height: 25.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: Colors.white, width: 2.0,),
                    image: DecorationImage(
                      image: NetworkImage(userImg),
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
    Size size = MediaQuery.of(context).size;
    ThemeData theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        width: size.width,
        height: 100.0,
        child: ListView.builder(
          itemCount: this.status.length + 1,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            if (position == 0) {
              return this.add(
                color: theme.primaryColor,
              );
            } else {
              Map<String, String> item = this.status[position - 1];
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
