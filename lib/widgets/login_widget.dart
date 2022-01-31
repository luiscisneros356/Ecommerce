import 'package:ecommercemobile/widgets/register_widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool activar = true;
  late TextEditingController emailController2;
  late TextEditingController contrasenia2;

  @override
  void initState() {
    emailController2 = TextEditingController();
    contrasenia2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TexfieldPersonalizado(
                titulo: 'Email',
                controller: emailController2,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TexfieldPersonalizado(
                titulo: "Contraseña",
                controller: contrasenia2,
              ),
            ),
            Container(
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellowAccent.shade700),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () {
                    print("${contrasenia2.text}, ${emailController2.text}");
                    Navigator.of(context).pushNamed("pay");
                  },
                  child: Text(
                    "Ingresar",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
