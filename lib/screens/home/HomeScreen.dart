
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/Styles.dart';
import 'package:test_home/model/HomeInfo.dart';
import 'package:test_home/components/MainButton.dart';
import 'package:test_home/components/ImageSlider.dart';
import 'package:test_home/screens/home/components/CardPrice.dart';
import 'package:test_home/screens/home/components/CardHeader.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.homeInfo,
  }) : super(key: key);

  final HomeInfo homeInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Config.padding),
              child: CardHeader(
                title: homeInfo.name, label: homeInfo.location,
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    homeInfo.imageLinks.isNotEmpty
                        ? ImageSlider(source: homeInfo.imageLinks)
                        : const SizedBox(),

                    Padding(
                      padding: EdgeInsets.all(Config.padding),
                      child: Text(
                        homeInfo.description, style: Styles.textDescriptionStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Config.shadowColor.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, -1), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                vertical: Config.padding * 1.5, horizontal: Config.padding,
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: Config.padding / 1.7),
                    child: CardPrice(price: homeInfo.price,),
                  ),

                  Expanded(child: MainButton(
                    label: 'Назад', onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
