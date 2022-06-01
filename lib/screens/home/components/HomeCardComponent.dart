
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/Styles.dart';
import 'package:test_home/model/HomeInfo.dart';
import 'package:test_home/screens/home/HomeScreen.dart';
import 'package:test_home/components/ImageComponent.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_home/screens/home/components/CardPrice.dart';
import 'package:test_home/screens/home/components/CardHeader.dart';

class HomeCardComponent extends StatelessWidget {
  const HomeCardComponent({
    Key? key,
    required this.item,
  }) : super(key: key);

  final HomeInfo item;

  String _getReviewField(int reviews) {
    String? checkOneNumber;
    String reviewNumber = '$reviews';
    String lastNumber = reviewNumber.substring(reviewNumber.length - 1);

    try {
      checkOneNumber = reviewNumber.substring(
        reviewNumber.length - 2, reviewNumber.length - 1,
      );
    } catch (e) {}

    if (checkOneNumber == '1') {
      return '($reviews отзывов)';
    }

    switch (lastNumber) {
      case '1':
        return '($reviews отзыв)';
      case '2':case '3':case '4':
        return '($reviews отзыва)';
      default:
        return '($reviews отзывов)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(homeInfo: item),
        ));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Config.activityBorderRadius),
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Config.activityBorderRadius),
                topRight: Radius.circular(Config.activityBorderRadius),
              ),
              child: item.imageLinks.isNotEmpty
                  ? ImageComponent(link: item.imageLinks[0],)
                  : const SizedBox(),
            ),

            Padding(
              padding: EdgeInsets.all(Config.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CardHeader(title: item.name, label: item.location),

                  SizedBox(height: Config.padding,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          RatingBarIndicator(
                            itemCount: 5,
                            rating: item.rating.toDouble(),
                            itemSize: Config.textSmallSize + 2,
                            unratedColor: Config.primaryLightColor,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star, color: Config.primaryColor,
                            ),
                          ),

                          SizedBox(width: Config.padding / 4,),

                          Text(
                            _getReviewField(item.reviewCount),
                            style: Styles.textTileColorSmallStyle,
                          ),
                        ],
                      ),

                      CardPrice(price: item.price,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: Config.padding),
      ),
    );
  }
}
