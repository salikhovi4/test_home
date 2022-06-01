
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_home/Styles.dart';

class CardPrice extends StatelessWidget {
  const CardPrice({
    Key? key,
    required this.price,
  }) : super(key: key);

  final int price;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '${NumberFormat("#,000", "ru").format(price)} ₽',
            style: Styles.titleBoldStyle,
          ),

          TextSpan(
            text: '/сут.',
            style: Styles.textTileColorStyle,
          ),
        ],
      ),
    );
  }
}
