import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            alignment: Alignment(0.3, 0),
            image: AssetImage('background.jpg'),
          ),
        ),
        width: size.width,
        height: size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: size.width,
              height: max(300, (size.height / 3)),

              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, top: 16),
                    // padding: const EdgeInsets.all(16),
                    height: 50,
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                          Colors.red,
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                      onPressed: () => {Navigator.pushNamed(context, '/login')},
                      child: const Text(
                        'Já tenho uma conta',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16, top: 16),
                    // padding: const EdgeInsets.all(16),
                    height: 50,
                    width: size.width * 0.8,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll(
                          Colors.white,
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: const BorderSide(
                                  color: Colors.red, width: 1)),
                        ),
                      ),
                      onPressed: () => {Navigator.pushNamed(context, '/singup')},
                      child: const Text(
                        'Criar nova conta',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Acessar com"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly
                          ,
                          children: [
                            IconButton(
                              onPressed: () => {},
                              icon: const Icon(Icons.apple, size: 42),
                            ),
                            IconButton(

                              onPressed: () => {},
                              icon: const Icon(Icons.facebook, size: 42),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () => {
      //       Navigator.pushNamed(context, '/secondPage'),
      //       }),
    );
  }
}
