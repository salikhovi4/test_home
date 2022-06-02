
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_home/components/ImageComponent.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    Key? key,
    required this.source,
  }) : super(key: key);

  final List<dynamic> source;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late List<dynamic> _source;
  late CarouselController _controller;

  int _current = 0;

  @override
  void initState() {
    super.initState();

    _source = widget.source;
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: Config.imageHeight,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: _source.map((link) => ImageComponent(link: link)).toList(),
        ),

        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _source.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: AnimatedContainer(
                  width: Config.dotSize,
                  height: Config.dotSize,
                  margin: EdgeInsets.all(Config.padding / 4),
                  duration: Duration(milliseconds: Config.animDuration),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key
                        ? Config.primaryLightColor
                        : Config.textColorOnPrimary,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
