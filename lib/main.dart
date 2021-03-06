import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/expandablecardpage.dart';
import 'components/expandablecard.dart';

import 'package:flutter/cupertino.dart';

void main() => runApp(SlidingCardApp());

class SlidingCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.pinkAccent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget _page() => Center(
        child: Text(
          "Expandable Card",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ExpandableCardPage(
        page: _page(),
        expandableCard: ExpandableCard(
          backgroundColor: Colors.pinkAccent,
          padding: EdgeInsets.only(top: 5, left: 20, right: 20),
          maxHeight: MediaQuery.of(context).size.height - 100,
          minHeight: 150,
          hasRoundedCorners: true,
          hasShadow: true,
          children: <Widget>[
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: 65,
                    color: Colors.white,
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://s3.amazonaws.com/media.thecrimson.com/photos/2019/04/14/200610_1337381.jpeg",
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Old Town Road",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Lil Nas X",
                      style: TextStyle(fontSize: 18.0, color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 180),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () => 1,
                  colorBrightness: Brightness.light,
                  splashColor: Colors.white10,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                FlatButton(
                  onPressed: () => 1,
                  colorBrightness: Brightness.light,
                  splashColor: Colors.white10,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
                FlatButton(
                  onPressed: () => 1,
                  colorBrightness: Brightness.light,
                  splashColor: Colors.white10,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 50,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
