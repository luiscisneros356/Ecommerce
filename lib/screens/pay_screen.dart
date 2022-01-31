import 'package:ecommercemobile/provider/product_provider.dart';
import 'package:ecommercemobile/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pay extends StatefulWidget {
  Pay({Key? key}) : super(key: key);

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  bool recordarTarjeta = true;
  bool tarjetaCredito = true;
  bool transferenciaCbu = true;
  bool mercadoPago = true;
  bool efectivo = true;

  TextStyle textStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController codigoController = TextEditingController();

  @override
  void initState() {
    nombreController = TextEditingController();
    apellidoController = TextEditingController();
    direccionController = TextEditingController();
    codigoController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    showAltertaDialog(context) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text("Gracias por tu Compra"),
            ),
            content: GestureDetector(
              onTap: () => Navigator.of(context).pushNamed("home"),
              child: Icon(
                Icons.check_circle,
                color: Colors.blueGrey,
                size: 60.0,
              ),
            ),
          );
        },
      );
    }

    final productProvider = Provider.of<ProductProvider>(context);

    return SafeArea(
      child: Scaffold(
        drawer: DrawerPersonalizado(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueGrey.shade800,
          centerTitle: true,
          title: Image.asset("assets/logo.jpg"),
          actions: [CarritoCompras(productProvider: productProvider)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Card(
              elevation: 5,
              child: Container(
                width: 700,
                height: 550,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text("Pago con Tarjeta"),
                      TextField(
                        controller: direccionController,
                        decoration: const InputDecoration(
                            hintText: "Correo electronico",
                            suffixIcon: Icon(
                              Icons.email_outlined,
                            )),
                      ),
                      TextField(
                        controller: direccionController,
                        decoration: const InputDecoration(
                            hintText: "Informacion de la tarje",
                            suffixIcon: Icon(
                              Icons.credit_score_outlined,
                            )),
                      ),
                      ListTile(
                        title: Container(
                          height: 40,
                          width: 100,
                          child: TextField(
                            controller: codigoController,
                            decoration: const InputDecoration(
                              hintText: "MM / AA",
                            ),
                          ),
                        ),
                        leading: Container(
                          height: 40,
                          width: 150,
                          child: TextField(
                            controller: codigoController,
                            decoration: const InputDecoration(
                              hintText: "CVC",
                            ),
                          ),
                        ),
                      ),
                      TextField(
                        controller: direccionController,
                        decoration: const InputDecoration(
                          hintText: "Nombre de la tarjeta",
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            showAltertaDialog(context);
                          },
                          child: Text("Realizar Pago"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
