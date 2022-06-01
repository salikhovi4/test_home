
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/Styles.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({
    Key? key,
    required this.title,
    this.description,
  }) : super(key: key);

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title, style: Styles.textTileColorStyle,),

        description != null ? Padding(
          padding: EdgeInsets.only(top: Config.padding / 2),
          child: Text(description!, style: Styles.textStyle,),
        ) : const SizedBox(),
      ],
    );
  }
}
