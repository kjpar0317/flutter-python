import 'package:flutter/material.dart';

import 'custom_colors.dart';
import '../widgets/common_size.dart';

///Config ThemeData For LightMode
ThemeData _getThemeData(BuildContext context) {
  final baseTheme = ThemeData.light();
  TextTheme textTheme = getTextTheme(baseTheme.textTheme);
  return baseTheme.copyWith(
      textTheme: textTheme,
      primaryColor: Color(0xFF097AD3),
      // accentColor: const Color(0xFF0095DE),
      canvasColor: Colors.white,
      // buttonColor: const Color(0xFF0095DE),
      cardColor: Colors.white,
      toggleableActiveColor: const Color(0xFF2F80ED),
      errorColor: Colors.redAccent,
      backgroundColor: Color(0xFFF7F7F7),
      primaryIconTheme:
          baseTheme.iconTheme.copyWith(color: const Color(0xFF9C9C9C)),
      indicatorColor: Color(0xFF565656),
      iconTheme: baseTheme.iconTheme.copyWith(color: const Color(0xFF565656)),
      scaffoldBackgroundColor: Color(0xFFF4F4F4),
      dividerColor: Color(0xFFDFDFDF),
      bottomAppBarColor: Color(0xFFE5E5E5),
      disabledColor: Colors.grey[400],
      elevatedButtonTheme: getElevatedButtonTheme(textTheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: getOutlinedButtonTheme(textTheme).style?.copyWith(
              textStyle: MaterialStateProperty.all(
                  textTheme.caption?.copyWith(color: Color(0xFF208CCC))),
              side: MaterialStateProperty.all(
                BorderSide(color: Color(0xFF208CCC), width: 1),
              ),
            ),
      ),
      textButtonTheme: getTextButtonTheme(textTheme),
      // accentTextTheme: baseTheme.accentTextTheme.copyWith(
      //     subtitle2: textTheme.subtitle2?.copyWith(color: Colors.black87),
      //     headline6:
      //         textTheme.headline6?.copyWith(color: const Color(0xFF1890FF))),
      tabBarTheme: baseTheme.tabBarTheme.copyWith(
        labelColor: Color(0xff7344D9),
        labelStyle: tabBarTextStyle(textTheme),
        unselectedLabelStyle: tabBarTextStyle(textTheme),
        unselectedLabelColor: Color(0xFF565656),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      appBarTheme: AppBarTheme(
        color: baseTheme.cardColor,
        // textTheme: textTheme,
        iconTheme: IconThemeData(color: Color(0xFF565656)),
      ),
      colorScheme: ColorScheme.light().copyWith(
        secondary: Color(0xFF0095DE),
        onSecondary: Color(0xFF6AA4D2),
        background: Color(0xFF2F6C9B),
        onPrimary: Colors.white,
        primary: Color(0xFF097AD3),
        onBackground: Color(0xFF0095DE),
        onSurface: Colors.black87,
        surface: Color(0xFFEDEDED),
      ),
      cardTheme: baseTheme.cardTheme.copyWith(elevation: 0.0));
}

///Config ThemeData For DarkMode
ThemeData _getThemeDataDark(BuildContext context) {
  final baseTheme = ThemeData.dark();
  TextTheme textTheme = getTextTheme(baseTheme.textTheme);
  return baseTheme.copyWith(
    textTheme: textTheme,
    dividerColor: const Color(0xFF353F4A),
    // accentColor: const Color(0xFF0095DE),
    scaffoldBackgroundColor: Colors.black,
    cardColor: Color(0xFF1E252D),
    primaryColor: const Color(0xFF1A1E2D),
    backgroundColor: const Color(0xFF2A3139),
    // buttonColor: const Color(0xFF0095DE),
    toggleableActiveColor: const Color(0xFF925FFF),
    bottomAppBarColor: const Color(0xFF171717),
    appBarTheme: AppBarTheme(
      color: Color(0xFF171717),
      // textTheme: textTheme,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    elevatedButtonTheme: getElevatedButtonTheme(textTheme),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: getOutlinedButtonTheme(textTheme).style?.copyWith(
            textStyle: MaterialStateProperty.all(
                textTheme.caption?.copyWith(color: Color(0xFF208CCC))),
            side: MaterialStateProperty.all(
              BorderSide(color: Color(0xFF208CCC), width: 1),
            ),
          ),
    ),
    textButtonTheme: getTextButtonTheme(textTheme),
    // accentTextTheme: baseTheme.accentTextTheme.copyWith(
    //   subtitle2: textTheme.subtitle2?.copyWith(color: const Color(0xFFFFC977)),
    //   headline6: textTheme.headline6?.copyWith(color: Colors.white),
    // ),
    tabBarTheme: baseTheme.tabBarTheme.copyWith(
      labelColor: const Color(0xFFFFFFFF),
      unselectedLabelColor: Color(0xFFB1B1B1),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: tabBarTextStyle(textTheme),
      unselectedLabelStyle: tabBarTextStyle(textTheme),
    ),
    colorScheme: ColorScheme.dark().copyWith(
      secondary: Color(0xFF8A89A0),
      onSecondary: Colors.white,
      background: Colors.black,
      surface: Color(0xFF121212),
      onBackground: Colors.grey,
      onPrimary: Colors.white,
    ),
    cardTheme: baseTheme.cardTheme.copyWith(elevation: 0.0),
  );
}

ThemeData getTheme(BuildContext context, bool isLight) {
  if (isLight) {
    return _getThemeData(context);
  } else {
    return _getThemeDataDark(context);
  }
}

class DynamicTheme extends InheritedWidget {
  final BuildContext context;
  late ThemeData themeData;
  late CustomColor customColor;
  late bool isThemeLight;

  DynamicTheme(this.context,
      {Key? key, required Widget child, bool isThemeLight = true})
      : super(key: key, child: child) {
    themeData = getTheme(context, isThemeLight);
    customColor = getCustomColor(isThemeLight);
  }

  @override
  bool updateShouldNotify(DynamicTheme oldWidget) {
    return true;
  }

  static DynamicTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DynamicTheme>()!;
  }
}
