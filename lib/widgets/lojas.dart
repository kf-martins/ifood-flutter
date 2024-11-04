import 'package:flutter/material.dart';

class Loja extends StatefulWidget {
  Loja(
      {super.key,
      this.favorite = false,
      this.nome = "Loja",
      this.desc = "Descrição"});

  bool favorite;
  String nome;
  String desc;

  @override
  State<StatefulWidget> createState() => _LojaState();
}

class _LojaState extends State<Loja> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(widget.nome,
                      style: const TextStyle(decoration: null, fontSize: 16)),
                  const Text("descrição",
                      style: TextStyle(decoration: null, fontSize: 14))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.favorite = !widget.favorite;
                      });
                      },
                    icon: Icon(Icons.star, color: (widget.favorite ? Colors.amber : Colors.grey),),
                    color: (widget.favorite ? Colors.grey : Colors.amber)),
                ],
              )
            ],
          ),
        ));
  }
}
