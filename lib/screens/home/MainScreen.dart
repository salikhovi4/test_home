
import 'package:flutter/material.dart';
import 'package:test_home/Config.dart';
import 'package:test_home/model/HomeInfo.dart';
import 'package:test_home/modelView/HomeData.dart';
import 'package:test_home/components/CustomTab.dart';
import 'package:test_home/components/ErrorComponent.dart';
import 'package:test_home/components/CustomProgressIndicator.dart';
import 'package:test_home/screens/home/components/HomeCardsComponent.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final double tabHeight = 32;

  late List<List<dynamic>> _tabs;
  late Future<Map<String, dynamic>> _future;

  HomeType? _type;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _future = _getHomesData();
    _tabs = [
      ['все дома', null], ['O-frame', HomeType.o], ['A-frame', HomeType.a],
    ];
  }

  Future<Map<String, dynamic>> _getHomesData() async {
    return await HomeData.getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Config.padding,),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: tabHeight,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  itemBuilder: (context, index) => CustomTab(
                    label: _tabs[index][0], active: _selectedIndex == index,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = index;
                        _type = _tabs[index][1];
                      });
                    },
                  ),
                  separatorBuilder: (context, index) =>
                    SizedBox(width: Config.padding / 2,),
                ),
              ),
              
              SizedBox(height: Config.padding,),

              FutureBuilder<Map<String, dynamic>>(
                future: _future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                      child: Center(
                        child: CustomProgressIndicator(),
                      ),
                    );
                  } else if (snapshot.error != null) {
                    return ErrorComponent(
                      title: 'Ошибка при загрузке данных',
                      description: snapshot.error.toString(),
                    );
                  } else {
                    if (snapshot.data != null) {
                      Map<String, dynamic> response = snapshot.data!;
                      if (response['status'] == 'success') {
                        return Expanded(
                          child: HomeCardsComponent(
                            data: response['data'], homeType: _type,
                          ),
                        );
                      } else {
                        return Expanded(child: ErrorComponent(
                          title: 'Ошибка',
                          description: response['errorText'],
                        ));
                      }
                    }

                    return const Expanded(child: ErrorComponent(
                      title: 'Ошибка', description: 'Неизвестная ошибка',
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
