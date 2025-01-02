import 'package:flutter/material.dart';
import 'package:ifood/widgets/lojas.dart';

class RestauranteTab extends StatelessWidget {
  final double TAB_WIDTH;

  const RestauranteTab({super.key, this.TAB_WIDTH = 100});

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Container(
            width: TAB_WIDTH,
            height: 20,
            alignment: Alignment.center,
            child: const Text("Restaurantes")
            )
          );
  }
}

class RestaurantesTabView extends StatefulWidget {
  const RestaurantesTabView({super.key});

  @override
  State<StatefulWidget> createState() => _RestauranteTabView();
}

class _RestauranteTabView extends State<RestaurantesTabView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Loja(
              nome: "McDonalds",
              desc: "Loja do mcdonalds",
              favorite: false,
              icon: "lojas/mcdonalds.png",
            ),
            Loja(
              favorite: true,
            ),
            Loja(),
          ],
        ),
      ],
    );
  }
}
