
import 'package:flutter/material.dart';
import 'package:test_home/model/HomeInfo.dart';
import 'package:test_home/screens/home/components/HomeCardComponent.dart';

class HomeCardsComponent extends StatelessWidget {
  const HomeCardsComponent({
    Key? key,
    required this.data,
    this.homeType,
  }) : super(key: key);

  final HomeType? homeType;
  final List<HomeInfo> data;

  List<Widget> _buildCards() {
    Iterable<HomeInfo> newData = [...data];

    if (homeType == HomeType.a) {
      newData = newData.where((element) => element.type == HomeType.a);
    } else if (homeType == HomeType.o) {
      newData = newData.where((element) => element.type == HomeType.o);
    }

    return newData.map((item) => HomeCardComponent(item: item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: _buildCards(),
      ),
    );
  }
}
