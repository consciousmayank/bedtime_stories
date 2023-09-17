import 'package:flutter/material.dart';

/// The max width the content can ever take up on the screen
const double kdDesktopMaxContentWidth = 1150;

// The max height the homeview will take up

const double kdDesktopMaxContentHeight = 750;

//Hive Class ids
const int storyResponseTypeId = 1;
const int storyResponseChoiceTypeId = 2;
const int storyResponseMessageTypeId = 3;
const int storyResponseUsageTypeId = 4;

const Color colorBlue = Colors.blue;
const Color colorGreen = Colors.green;
const Color colorRed = Colors.red;
const Color colorYellow = Colors.yellow;
const Color colorPink = Colors.pink;
const Color colorGrey = Colors.grey;
const Color colorBrown = Colors.brown;
const Color unselectedTabLabelColor = Colors.white;
get defaultBorderRadius => BorderRadius.circular(defaultBorder);
double get defaultBorder => 4;
double get getDefaultRadius => 8;

RoundedRectangleBorder getCardShape({double? radius}) {
  return RoundedRectangleBorder(
    borderRadius: getBorderRadius(
      radius: radius,
    ),
  );
}

getBorderRadius({double? radius}) {
  return BorderRadius.circular(
    radius ?? getDefaultRadius,
  );
}
