
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/screens/home/MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test home',
      theme: ThemeData(
        primarySwatch: MaterialColor(Config.primaryColor.value, {
          50:Config.primaryColor.withOpacity(.1),
          100:Config.primaryColor.withOpacity(.2),
          200:Config.primaryColor.withOpacity(.3),
          300:Config.primaryColor.withOpacity(.4),
          400:Config.primaryColor.withOpacity(.5),
          500:Config.primaryColor.withOpacity(.6),
          600:Config.primaryColor.withOpacity(.7),
          700:Config.primaryColor.withOpacity(.8),
          800:Config.primaryColor.withOpacity(.9),
          900:Config.primaryColor.withOpacity(1),
        }),

        fontFamily: 'Roboto',
        shadowColor: Config.shadowColor,
        primaryColor: Config.primaryColor,
        highlightColor: Colors.transparent,
        splashColor: Config.primaryLightColor,
        scaffoldBackgroundColor: Config.activityBackColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MainScreen(),
    );
  }
}
