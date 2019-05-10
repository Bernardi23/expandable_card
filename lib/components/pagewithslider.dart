import 'package:flutter/material.dart';

import 'slidablecard.dart';

class PageWithSlider extends StatelessWidget {
  PageWithSlider({@required this.page, @required this.slidableCard});

  final Widget page;
  final SlidableCard slidableCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        page,
        slidableCard
      ],
    );
  }
}
