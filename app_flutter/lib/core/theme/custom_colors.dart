import 'package:flutter/material.dart';

class CustomColor {
  final Color? buttonBottomColor;
  final Color? backgroundAppBarColor;
  final Color? backgroundAlertColor;
  final Color? backgroundSegmentColor;
  final Color? activeSegmentColor;
  final Color? bgMessageChat;
  final Color? bgMessageChatOther;
  final Color? textMessageChat;
  final Color? textMessageChatOther;
  final Color? backgroundWarning;
  final Color? ksBackgroundAction;
  final Color? highlightColor;
  final Color? accentColor;
  final Color? subtitleColor;
  final Color? pendingColor;
  final Color? shimmerChild;
  final Color? shimmerHighlight;
  final Color? logoBlue;
  final Color? headerColor;
  final Color? red;
  final Color? green;
  final Color? yellow;
  final Color? red2;
  final Color? tabBarColor;
  final Color? titleColor;
  final Color? emptyColor;
  final Color? titleColor2;

  CustomColor(
      {this.buttonBottomColor,
      this.backgroundAppBarColor,
      this.backgroundAlertColor,
      this.backgroundSegmentColor,
      this.activeSegmentColor,
      this.bgMessageChat,
      this.bgMessageChatOther,
      this.textMessageChat,
      this.textMessageChatOther,
      this.backgroundWarning,
      this.ksBackgroundAction,
      this.highlightColor,
      this.accentColor,
      this.subtitleColor,
      this.pendingColor,
      this.shimmerChild,
      this.shimmerHighlight,
      this.logoBlue,
      this.headerColor,
      this.red,
      this.green,
      this.yellow,
      this.red2,
      this.tabBarColor,
      this.titleColor,
      this.emptyColor,
      this.titleColor2});
}

CustomColor getCustomColor(bool isLight) {
  if (isLight) {
    return CustomColor(
      buttonBottomColor: Color(0xFF0095DE),
      backgroundAppBarColor: Colors.white,
      backgroundAlertColor: Color(0xFF0095DE),
      backgroundSegmentColor: Color(0xFFE1E1E1),
      activeSegmentColor: Colors.white,
      bgMessageChat: const Color(0xff0095DE),
      bgMessageChatOther: Color(0xffF4F4F4),
      textMessageChat: Colors.white,
      textMessageChatOther: Colors.black,
      backgroundWarning: Color(0xFFF2FBD7),
      ksBackgroundAction: Color(0xFFFFFFFF),
      highlightColor: Color(0xFF83AB2F),
      accentColor: Color(0xFF01CAE9),
      subtitleColor: Color(0xFF545454),
      pendingColor: Color(0xFFB1B0B0),
      shimmerChild: Colors.black54,
      shimmerHighlight: Color(0xFF4F4F4),
      logoBlue: Color(0xFF208CCC),
      headerColor: Color(0xFF818181),
      red: Color(0xFFFF0000),
      green: Color(0xFF83AB2F),
      yellow: Color(0xFFCEAC26),
      red2: Color(0xFF83AB2F),
      tabBarColor: Color(0xFF9B90E1),
      titleColor: Color(0xFF333333).withOpacity(0.1),
      emptyColor: Color(0xFFD2D2D2),
      titleColor2: Colors.black,
    );
  } else {
    //dark
    return CustomColor(
      buttonBottomColor: Color(0xFF0095DE),
      backgroundAppBarColor: Color(0xFF171717),
      backgroundAlertColor: Color(0xFF0095DE),
      backgroundSegmentColor: Color(0xFF000000),
      activeSegmentColor: Color(0xFF171717),
      bgMessageChat: const Color(0xFF767676),
      bgMessageChatOther: const Color(0xFF2C2C2C),
      textMessageChat: Colors.white,
      textMessageChatOther: Colors.white,
      backgroundWarning: Color(0xFF3D3D3D),
      ksBackgroundAction: Color(0xFF484848),
      highlightColor: Color(0xFF83AB2F),
      accentColor: Color(0xFF01CAE9),
      subtitleColor: Color(0xFF545454),
      pendingColor: Color(0xFFB1B0B0),
      shimmerChild: Color(0xFFE8E8E8),
      shimmerHighlight: Color(0xFF4F4F4),
      logoBlue: Color(0xFF208CCC),
      headerColor: Color(0xFFAFAFAF),
      red: Color(0xFFFF0000),
      green: Color(0xFF83AB2F),
      yellow: Color(0xFFCEAC26),
      red2: Color(0xFF83AB2F),
      tabBarColor: Colors.white,
      titleColor: Color(0xFF2A3139),
      emptyColor: Colors.white,
      titleColor2: Color(0xFFAFAFAF),
    );
  }
}