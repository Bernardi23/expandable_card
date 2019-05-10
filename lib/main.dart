import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/pagewithslider.dart';
import 'components/slidablecard.dart';

void main() => runApp(SlidingCardApp());

class SlidingCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
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
          "Hello world",
          style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: PageWithSlider(
        page: _page(),
        slidableCard: SlidableCard(),
      ),
    );
  }
}
