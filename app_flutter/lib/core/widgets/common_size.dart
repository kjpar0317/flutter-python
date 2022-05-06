import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double submitButtonWith = 245;

get minButtonSize => Size(32.sp, 32.sp);

get minSubmitButtonSize => Size(45.sp, 44.sp);

get borderButton => 6.sp;

double get sp4 => 4.0.sp;
double get sp8 => 8.0.sp;
double get sp12 => 12.0.sp;
double get sp16 => 16.0.sp;
double get sp23 => 23.0.sp;
double get sp24 => 24.0.sp;

double toSp(num value) {
  return value.sp;
}

TextStyle? tabBarTextStyle(TextTheme textTheme) {
  return textTheme.subtitle2;
}

//https://api.flutter.dev/flutter/material/TextTheme-class.html
getTextTheme(TextTheme textTheme) {
  // return textTheme;
  return textTheme.copyWith(
    bodyText2: textTheme.bodyText2?.copyWith(
      fontSize: 14.sp,
    ),
    bodyText1: textTheme.bodyText1?.copyWith(
      fontSize: 14.sp,
      color: textTheme.caption?.color,
    ),
    subtitle2: textTheme.subtitle2?.copyWith(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    ),
    subtitle1: textTheme.subtitle1?.copyWith(
      fontSize: 16.sp,
    ),
    caption: textTheme.caption?.copyWith(
      fontSize: 12.sp,
    ),
    headline5: textTheme.headline5?.copyWith(
      fontSize: 24.sp,
    ),
    headline6: textTheme.headline6?.copyWith(
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
    ),
    headline4: textTheme.headline4?.copyWith(
      fontSize: 30.sp,
    ),
    //caption chữ bé mờ
    overline: textTheme.overline?.copyWith(
      fontSize: 10.sp,
    ),
  );
}

ElevatedButtonThemeData getElevatedButtonTheme(TextTheme textTheme) =>
    ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: minButtonSize,
        elevation: 0.0,
        textStyle: textTheme.subtitle2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderButton),
        ),
      ),
    );
OutlinedButtonThemeData getOutlinedButtonTheme(TextTheme textTheme) =>
    OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: minButtonSize,
        textStyle: textTheme.subtitle2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderButton),
        ),
      ),
    );
TextButtonThemeData getTextButtonTheme(TextTheme textTheme) =>
    TextButtonThemeData(
      style: TextButton.styleFrom(minimumSize: minButtonSize),
    );