import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {

  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _loginKey = GlobalKey<FormState>();

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginKey,
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: 124,
          title: Container(
              margin: const EdgeInsets.only(top: 22),
              child: const Text("Login")),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: "Arial",
            decoration: null,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: SizedBox(
                width: 380,
                height: 620,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: null,
                                )),
                            Container(
                              margin: const EdgeInsets.only(top: 6),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: userController,
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "Insira um nome válido";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    hintText: "Digite seu Email",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(160, 160, 160, 1)),
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Senha",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  decoration: null,
                                )),
                            Container(
                              margin: const EdgeInsets.only(top: 6, bottom: 0),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextFormField(
                                controller: passwordController,
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "Senha inválida";
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                    hintText: "Digite sua Senha",
                                    hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(160, 160, 160, 1)),
                                    icon: Icon(
                                      Icons.lock,
                                      color: Colors.red,
                                      size: 24,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        )),
                    Container(
                        margin: const EdgeInsets.only(top: 6, bottom: 4),
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(380, 52),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () {
                                if (_loginKey.currentState!.validate()) {
                                  // Navigator.pushReplacementNamed(context, '/homePage');
                                  Navigator.pushNamedAndRemoveUntil(context, '/homePage', (routes) => false);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text("Email e senha válidos!")));
                                }
                              },
                              child: const Text("Entrar"),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Criar conta",
                                    style: TextStyle(color: Colors.white)),
                                Text("Esqueci minha senha",
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
