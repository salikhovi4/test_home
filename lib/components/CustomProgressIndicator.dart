
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:flutter/cupertino.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return const CircularProgressIndicator();
    }
    return CupertinoActivityIndicator(
      color: Config.primaryColor, radius: Config.activityBorderRadius,
    );
  }
}
