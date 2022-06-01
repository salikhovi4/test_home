
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/Styles.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key? key,
    required this.label,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  final bool active;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: active ? Config.primaryColor : Config.activityHintColor,
          borderRadius: BorderRadius.circular(Config.maxBorder),
        ),
        padding: EdgeInsets.fromLTRB(
          Config.padding, Config.padding / 2, Config.padding, Config.padding / 2,
        ),
        duration: Duration(milliseconds: Config.animDuration),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: Config.animDuration),
          style: active ? Styles.textPrimaryStyle : Styles.textTileColorStyle,
          child: Text(label),
        ),
      ),
    );
  }
}
