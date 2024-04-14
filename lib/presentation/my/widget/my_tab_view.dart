import 'package:auda/presentation/my/widget/my_feed_list.dart';
import 'package:auda/presentation/my/widget/my_statistics.dart';
import 'package:flutter/material.dart';

class MyUserTabView extends StatelessWidget {
  const MyUserTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                text: '나의 글',
              ),
              Tab(
                text: '통계',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MyFeedList(),
            MyStatistics(),
          ],
        ),
      ),
    );
  }
}
