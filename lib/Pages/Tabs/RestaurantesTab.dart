import 'package:flutter/material.dart';
import 'package:ifood/widgets/lojas.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

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

  List<dynamic> lojas = [];
  late Future<void> futureLojas;

  @override
  void initState() { 
    super.initState();
    futureLojas = fetchLojas();
  }

  Future<void> fetchLojas() async { // As vezes o servidor para de funcionar
    final response = await http.get(Uri.parse('http://localhost:3000/restaurantes'));

    if (response.statusCode == 200) {
      setState(() {
        lojas = json.decode(response.body);
      });
    } else {
      throw Exception('Falha ao carregar as lojas');
    }
  }


  @override
  Widget build(BuildContext context) {
    
    print(lojas);

    return FutureBuilder<void>(
      future: futureLojas,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar as lojas'));
        } else {
          return ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: lojas.map((loja) => Loja(
                  nome: loja['NAME'],
                  desc: loja['DESC'],
                  favorite: false,
                  icon: loja['ICON'],
                )).toList(),
              ),
            ],
          );
        }
      },
    );
  }
}