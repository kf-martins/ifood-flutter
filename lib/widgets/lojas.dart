import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loja extends StatefulWidget {
  Loja(
      {super.key,
      this.favorite = false,
      this.nome = "Loja",
      this.desc = "Descrição",
      this.icon = "lojas/noicon.png"});

  bool favorite;
  String nome;
  String desc;
  String icon;

  @override
  State<StatefulWidget> createState() => _LojaState();
}

class _LojaState extends State<Loja> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey[400]!,
                      style: BorderStyle.solid,
                      width: 1
                      ),
                    ),
                  ),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: 50,
                    child: Image.asset(
                      widget.icon,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    children: [
                      Text(widget.nome,
                          style:
                              const TextStyle(decoration: null, fontSize: 16)),
                      const Text("descrição",
                          style: TextStyle(decoration: null, fontSize: 14))
                    ],
                  )
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
                      icon: Icon(
                        Icons.star,
                        color: (widget.favorite ? Colors.amber : Colors.grey),
                      ),
                      color: (widget.favorite ? Colors.grey : Colors.amber)),
                ],
              )
            ],
          ),
        ));
  }
}
