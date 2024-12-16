// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePageOld extends StatefulWidget {
  const HomePageOld({super.key});

  @override
  State<HomePageOld> createState() => _HomePageState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].
class _HomePageState extends State<HomePageOld>
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
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          dividerHeight: 0.0,
          indicatorColor: Colors.amber,
          // indicatorPadding: EdgeInsets.all(12.0),
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "Restaurantes",
            ),
            Tab(
              text: "Comidas",
            ),
            Tab(
              text: "Bebidas",
            ),
            Tab(
              text: "Mercados",
            ),
            Tab(
              text: "Farmácias",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(), 
          Container(),
          Container(),
          Container(),
          Container(),
          ],
      ),
    );
  }
}
