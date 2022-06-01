
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/components/CustomProgressIndicator.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    Key? key,
    required this.link,
    this.width,
  }) : super(key: key);

  final String link;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      link, height: Config.imageHeight, fit: BoxFit.cover,
      width: width ?? MediaQuery.of(context).size.width,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;

        return Container(
          height: Config.imageHeight,
          color: Colors.black.withOpacity(.5),
          child: const Center(child: CustomProgressIndicator(),),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        log('ImageComponent.build: $error');
        return Container(
          color: Colors.black.withOpacity(.5),
          child: Center(
            child: Icon(
              Icons.error, size: Config.iconSize,
              color: Config.primaryLightColor,
            ),
          ),
        );
      },
    );
  }
}
