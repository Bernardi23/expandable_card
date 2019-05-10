# Expandable Card

This is a Flutter Widget that makes it easy to build a page with a bottom Card that can be expanded on user drag.

  ![GIF Animation](https://media.giphy.com/media/1xoZG7PVqcTtNdBS3k/giphy.gif)
  
## How to use it

  Use `ExpandableCardPage` for the body of your `Scaffold`.  This widget will take two attributes:

- `Widget page`: which is the default page in the background
- `ExpandableCard expandableCard`: which is the bottom card itself. You can call the `ExpandableCard` constructor to build one.

`ExpandableCard` constructor has a few attributes:

- `EdgeInsetsGeometry padding`: padding inside the card. Default value is `EdgeInsets.all(15)`
- `double minHeight`: default height of the card when it's not expanded. Default value is `200`
- `double maxHeight`: height of the card when it's fully expanded. Default value is `500`
- `bool hasShadow`: determines whether the card has box shadow or not. Default is `true`
- `Color backgroundColor`: background color of the card. Default is `Colors.blueGrey`
- `bool hasRoundedCorners`: determines whether the card has rounded corners or not. Default is `false`
- `bool hasHandle`: will add a little handle icon. Default is `true`
- `List<Widget> Children`: Widgets that make the actual content of the card

## Future Implementations:
- `AnimatedExpandableCard`: will allow animation between closed state and expanded state.
- Add suport for scrolling card when its fully expanded
    
