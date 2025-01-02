// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ifood/Pages/Tabs/RestaurantesTab.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const HomePageTabBar();
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageTabBar();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _HomePageTabBar extends State<HomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names
    const double TAB_WIDTH = 100;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Container(
          padding: const EdgeInsets.only(top: 4),
          child: const Center(
            child: Text(
            "Av. Liberdade, 855",
            style: TextStyle(fontSize: 16.0),
          ),
          )
        ),
        bottom: TabBar(
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          labelPadding: const EdgeInsets.all(10.0),
          dividerHeight: 0.0,
          indicatorColor: Colors.amber,
          indicatorPadding: const EdgeInsets.all(10.0),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1.0,
          // indicatorPadding: EdgeInsets.all(12.0),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Container(
                width: TAB_WIDTH,
                height: 20,
                alignment: Alignment.center,
                child: const Text("Início"),
              ),
            ),
            const RestauranteTab(),
            Tab(
              child: Container(
                width: TAB_WIDTH,
                height: 20,
                alignment: Alignment.center,
                child: const Text("Comidas"),
              ),
            ),
            Tab(
              child: Container(
                width: TAB_WIDTH,
                height: 20,
                alignment: Alignment.center,
                child: const Text("Bebidas"),
              ),
            ),
            Tab(
              child: Container(
                width: TAB_WIDTH,
                height: 20,
                alignment: Alignment.center,
                child: const Text("Mercados"),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(),
          const RestaurantesTabView(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
