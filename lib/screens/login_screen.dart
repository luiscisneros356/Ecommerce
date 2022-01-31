import 'package:ecommercemobile/widgets/widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool activar = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(20)),
                            color: activar
                                ? Colors.blueGrey.shade700
                                : Colors.grey.shade300,
                          ),
                          child: TextButton(
                              onPressed: () {
                                activar = true;
                                setState(() {});
                              },
                              child: Text("Ingresar",
                                  style: TextStyle(
                                    color:
                                        activar ? Colors.white : Colors.black,
                                    fontSize: 20,
                                  ))),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20)),
                            color: activar
                                ? Colors.grey.shade300
                                : Colors.blueGrey.shade700,
                          ),
                          child: TextButton(
                            onPressed: () {
                              activar = false;
                              setState(() {});
                            },
                            child: Text("Registro",
                                style: TextStyle(
                                  color: activar ? Colors.black : Colors.white,
                                  fontSize: 20,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.blueGrey.shade700),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            activar ? LoginWidget() : RegisterWidgetProvider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
