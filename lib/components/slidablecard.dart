import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SlidableCard extends StatefulWidget {
  SlidableCard({
    @required this.content,
    this.padding = const EdgeInsets.all(15.0),
    this.minHeight = 100,
    this.maxHeight = 500,
    this.hasShadow = false,
    this.backgroundColor = Colors.blueGrey,
  });

  final Widget content;
  final EdgeInsetsGeometry padding;
  final double minHeight;
  final double maxHeight;
  final bool hasShadow;
  final Color backgroundColor;

  @override
  _SlidableCardState createState() => _SlidableCardState();
}

class _SlidableCardState extends State<SlidableCard>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationScrollPercent;
  bool _isAnimating = false;
  double _scrollPercent = 0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
  }

  final Widget debugContent = CustomScrollView(
    physics: NeverScrollableScrollPhysics(),
    slivers: <Widget>[
      SliverFillViewport(
        delegate: SliverChildBuilderDelegate(
          (context, index) => Text("Hello world"),
          childCount: 1,
        ),
      ),
      // SliverFixedExtentList(
      //   itemExtent: 40.0,
      //   delegate: SliverChildBuilderDelegate(
      //     (context, index) => index == 0 ? Text("Hello world") : null,
      //   ),
      // )
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: <Widget>[
      //     SizedBox(width: 20),
      //     ClipRRect(
      //       borderRadius: BorderRadius.all(Radius.circular(0)),
      //       child: Container(
      //         color: Colors.white,
      //         width: 70.0,
      //         height: 70.0,
      //       ),
      //     ),
      //     SizedBox(width: 15),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         Text(
      //           "Old Town Road",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      //         ),
      //         SizedBox(height: 7),
      //         Text(
      //           "Lil Nas X",
      //           style: TextStyle(fontSize: 12.0),
      //         )
      //       ],
      //     )
      //   ],
      // ),
      // SizedBox(height: 50.0),
      // Container(height: 200, width: 200, color: Colors.pink),
    ],
  );

  final Widget positionDebugContent = Column(
    children: <Widget>[Text("Hello world"), SizedBox(height: 50), Text("hi")],
  );

  void _startCardDrag(DragStartDetails details) {
    setState(() {
      _isAnimating = false;
    });
    _animationController.reset();
  }

  void _expandCard(DragUpdateDetails details) {
    final drag = details.delta.dy;
    if (drag < -0.3 && _scrollPercent < 1) {
      setState(() {
        _scrollPercent -= drag / 500;
      });
    } else if (drag > 0.3 && _scrollPercent > 0) {
      setState(() {
        _scrollPercent -= drag / 500;
      });
    }
  }

  void _endCardDrag(DragEndDetails details) {
    setState(() => _isAnimating = true);
    // CardSlider will expand
    if (details.primaryVelocity < -1000 || _scrollPercent > 0.7) {
      _animationScrollPercent =
          Tween<double>(begin: _scrollPercent, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      );
      _animationController.forward();
      setState(() => _scrollPercent = 1.0);
    }
    // Card Slider will not expand
    else {
      _animationScrollPercent =
          Tween<double>(begin: _scrollPercent, end: 0.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      );
      _animationController.forward();
      setState(() => _scrollPercent = 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        double factor =
            _isAnimating ? _animationScrollPercent.value : _scrollPercent;
        double top = MediaQuery.of(context).size.height -
            widget.minHeight -
            (widget.maxHeight - widget.minHeight) * factor;
        return Positioned(
          top: top,
          child: GestureDetector(
            onVerticalDragStart: _startCardDrag,
            onVerticalDragUpdate: _expandCard,
            onVerticalDragEnd: _endCardDrag,
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: _isAnimating
              //     ? _animationScrollPercent.value * widget.maxHeight +
              //         widget.minHeight
              //     : _scrollPercent * widget.maxHeight + widget.minHeight,
              height: widget.maxHeight,
              decoration: BoxDecoration(
                color: Colors.blueGrey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                boxShadow: [
                  if (widget.hasShadow)
                    BoxShadow(
                      blurRadius: 10.0,
                      spreadRadius: 10,
                      color: Colors.blueGrey[900].withOpacity(0.2),
                    )
                ],
              ),
              child: Padding(
                padding: widget.padding,
                // child: widget.content,
                child: positionDebugContent,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
