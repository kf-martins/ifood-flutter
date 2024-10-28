import 'package:flutter/material.dart';

class Loja extends StatefulWidget {
  const Loja({super.key, this.favorite = false});

  final bool favorite; 


  @override
  State<StatefulWidget> createState() => _LojaState();
}

class _LojaState extends State<Loja> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

}