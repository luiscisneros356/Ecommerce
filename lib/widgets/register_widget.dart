import 'package:ecommercemobile/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterWidgetProvider extends StatefulWidget {
  RegisterWidgetProvider({Key? key}) : super(key: key);

  @override
  _RegisterWidgetProviderState createState() => _RegisterWidgetProviderState();
}

class _RegisterWidgetProviderState extends State<RegisterWidgetProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: RegisterWidget(),
    );
  }
}

class RegisterWidget extends StatefulWidget {
  RegisterWidget({Key? key}) : super(key: key);

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  bool activar = true;
  bool activar2 = true;
  late TextEditingController contraseniaController;
  late TextEditingController emailController;
  late TextEditingController nombreController;
  late TextEditingController ciudadContoller;
  late TextEditingController direccionController;
  late TextEditingController codigopostalController;

  @override
  void initState() {
    super.initState();
    contraseniaController = TextEditingController();
    emailController = TextEditingController();
    nombreController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginFormProvider.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onChanged: (val) => loginFormProvider.email = val,
                  onSaved: (val) => loginFormProvider.name = val ?? "",
                  validator: (val) {
                    if (val?.contains("@") ?? false) {
                      return null;
                    }
                    return "No es un correro";
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: nombreController,
                  onChanged: (val) => loginFormProvider.name = val,
                  onSaved: (val) => loginFormProvider.name = val ?? "",
                  decoration: const InputDecoration(
                    hintText: "Nombre",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  controller: contraseniaController,
                  onChanged: (val) => loginFormProvider.password = val,
                  onSaved: (val) => loginFormProvider.name = val ?? "",
                  decoration: const InputDecoration(
                    hintText: "Contraseña",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  obscureText: true,
                  validator: (val) {
                    if (contraseniaController.text == val) {
                      return null;
                    }
                    return "La contraseña no es igual, repita la misma";
                  },
                  decoration: const InputDecoration(
                    hintText: "Repetir Contraseña",
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellowAccent.shade700),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),

                  // primary: loginFormProvider.esValido()
                  //     ? Colors.grey
                  //     : Colors.blue),
                  onPressed: () {
                    // if (loginFormProvider.esValido()) {
                    // FocusScope.of(context).unfocus();
                    // // loginFormProvider.email = emailController.text;
                    // // loginFormProvider.name = nombreController.text;
                    // // loginFormProvider.password = contraseniaController.text;

                    // Navigator.of(context).pushReplacementNamed("home");
                    // Future.delayed(Duration(seconds: 5));
                    // loginFormProvider.crearUsuario(
                    //     email: '${loginFormProvider.email}',
                    //     nombre: "${loginFormProvider.name}",
                    //     password: "${loginFormProvider.password}");

                    loginFormProvider.crearUsuario();
                  },

                  child: Text(
                    "Registrarme",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TexfieldPersonalizado extends StatelessWidget {
  TexfieldPersonalizado({
    Key? key,
    required this.titulo,
    required this.controller,
    this.textoOscuro = false,
  }) : super(key: key);

  final String titulo;
  final TextEditingController controller;
  bool textoOscuro = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: textoOscuro,
      controller: controller,
      decoration: InputDecoration(
        focusColor: Colors.white,
        fillColor: Colors.white,
        hintMaxLines: 2,
        hintText: titulo,
        hintStyle: TextStyle(overflow: TextOverflow.ellipsis),
        contentPadding: EdgeInsets.all(10),
      ),
    );
  }
}
