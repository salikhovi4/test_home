
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/Styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Config.primaryColor,
        borderRadius: BorderRadius.circular(Config.maxBorder),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(Config.padding),
          child: Text(
            label, style: Styles.titlePrimaryStyle, textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
