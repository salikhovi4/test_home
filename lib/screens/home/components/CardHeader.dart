
import 'package:flutter/material.dart';
import 'package:test_home/Styles.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({
    Key? key,
    required this.title,
    required this.label,
  }) : super(key: key);

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: Styles.titleBoldStyle,
        children: <TextSpan>[
          TextSpan(
            text: ' $label',
            style: Styles.titleTextColorBoldStyle,
          ),
        ],
      ),
    );
  }
}
