import 'package:flutter/material.dart';

class EnvStyle {
  static Color get themeColor {
    return HexColor("#ff6343");
  }

  static Color get themeColorLight {
    return HexColor("#FF7433");
  }

  static Color get themeColorLight2 {
    return HexColor("#FFB833");
  }

  static Color get bgColor {
    return HexColor("#f6f6e9");
  }

  static Color get fgColor {
    return HexColor("#f6f6e9");
  }

  static Color get blackColor {
    return HexColor("#000000");
  }

  static Color get whiteColor {
    return HexColor("#ffffff");
  }

  static Color get greenColor {
    return HexColor("#186A3B");
  }

  static Color get greenColorLight {
    return HexColor("#D5F5E3");
  }

  static Color get redColor {
    return HexColor("#FF0000");
  }

  static Color get pinkColor {
    return HexColor("#FFC0CB");
  }

  static Color get blueColor {
    return HexColor("#0000FF");
  }

  static Color get redColorLight {
    return HexColor("##F9EBEA");
  }

  static ButtonStyle get buttonStyle {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all<Color>(themeColorLight),
      padding: WidgetStateProperty.all<EdgeInsets>(
        const EdgeInsets.only(
          right: 34,
          left: 34,
          top: 20,
          bottom: 20,
        ), // You can adjust the values as needed
      ),
    );
  }

  static TextStyle get normalStyleWhite {
    return TextStyle(
        fontSize: 18, color: whiteColor, overflow: TextOverflow.clip);
  }

  static TextStyle get xLargeStyleWhite {
    return TextStyle(
        fontSize: 100, color: whiteColor, overflow: TextOverflow.clip);
  }

  static TextStyle get normalStyleBlack {
    return TextStyle(
      fontSize: 16,
      color: blackColor,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle get smallStyleBlack {
    return TextStyle(
      fontSize: 12,
      color: blackColor,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle get normalStyleGreen {
    return TextStyle(
        fontSize: 18, color: greenColor, overflow: TextOverflow.clip);
  }

  static TextStyle get largeStyleGreen {
    return TextStyle(
        fontSize: 20, color: greenColor, overflow: TextOverflow.clip);
  }

  static TextStyle get xLargeStyleGreen {
    return TextStyle(
        fontSize: 24, color: greenColor, overflow: TextOverflow.clip);
  }

  static TextStyle get normalStyleRed {
    return TextStyle(
        fontSize: 18, color: redColor, overflow: TextOverflow.clip);
  }

  static TextStyle get normalStyleBlackBold {
    return TextStyle(
        fontSize: 20,
        color: blackColor,
        overflow: TextOverflow.clip,
        fontWeight: FontWeight.bold);
  }

  static TextStyle get normalStyleBlackBig {
    return TextStyle(
      fontSize: 20,
      color: blackColor,
      overflow: TextOverflow.clip,
    );
  }

  static TextStyle get normalIntroStyle {
    return TextStyle(
        fontSize: 18,
        color: Colors.white,
        overflow: TextOverflow.clip,
        backgroundColor: Colors.blueGrey.shade900);
  }

  static TextStyle get normalMsgUnreadStyle {
    return const TextStyle(fontSize: 18, color: Colors.white);
  }

  static TextStyle get normalMsgReadStyle {
    return const TextStyle(
        fontSize: 18, color: Color.fromARGB(122, 255, 255, 255));
  }

  static TextStyle get normalWarningStyle {
    return TextStyle(
        fontSize: 18, color: redColor, overflow: TextOverflow.clip);
  }

  static TextStyle get normalHeadingStyle {
    return const TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold);
  }

  static TextStyle get normalSubHeadingStyle {
    return TextStyle(
        fontSize: 20, color: redColor, fontWeight: FontWeight.bold);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
