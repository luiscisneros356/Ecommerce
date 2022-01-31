import 'package:ecommercemobile/models/products.dart';
import 'package:ecommercemobile/models/products_.dart';
import 'package:ecommercemobile/provider/login_provider.dart';
import 'package:ecommercemobile/provider/product_provider.dart';
import 'package:ecommercemobile/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shop extends StatefulWidget {
  Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  bool activar = true;

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(25.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: activar ? Colors.white : Colors.grey,
                                child: TextButton(
                                  onPressed: () {
                                    activar = true;
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Carrito",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Carrito(),
                      ],
                    ),
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

class Carrito extends StatefulWidget {
  const Carrito({
    Key? key,
  }) : super(key: key);

  @override
  State<Carrito> createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    // final Product product =
    //     ModalRoute.of(context)!.settings.arguments as Product;
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: productProvider.productsList.isEmpty
              ? Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    child: Text("No hay productos en el carrito"),
                  ),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: productProvider.productsList.length,
                        itemBuilder: (context, index) {
                          final Producto producto =
                              productProvider.productsList[index];
                          final int cantidad =
                              productProvider.cantidadProducto[index];
                          // final String talleSeleccionado =
                          //     productProvider.talleSeleccionado[index];

                          return Dismissible(
                            background: Container(
                              color: Colors.blueGrey.shade700,
                            ),
                            key: ValueKey<Producto>(producto),
                            onDismissed: (DismissDirection direction) {
                              setState(() {
                                productProvider.productsList.removeAt(index);
                                productProvider.cantidadProducto
                                    .removeAt(index);
                                productProvider.carritoItem--;

                                productProvider.pagoTotal -=
                                    producto.price! * cantidad;
                              });
                            },
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    child: FadeInImage(
                                      placeholder:
                                          AssetImage("assets/loading.gif"),
                                      image: NetworkImage(producto.img![0].url),
                                    ),
                                  ),
                                  title: Text(
                                    producto.name ?? "",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Cantidad: ${cantidad}"),
                                      // Text("Talle: ${talleSeleccionado}")
                                    ],
                                  ),
                                  trailing: Text("\$${producto.price}"),
                                ),
                                Divider(
                                  thickness: 2.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text("Total: \$${productProvider.pagoTotal}"),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "login");
                        },
                        child: Text("Finalizar compra"))
                  ],
                ),
        ),
      ),
    );
  }
}

class DatosPersonales extends StatefulWidget {
  const DatosPersonales({
    Key? key,
  }) : super(key: key);

  @override
  State<DatosPersonales> createState() => _DatosPersonalesState();
}

class _DatosPersonalesState extends State<DatosPersonales> {
  @override
  Widget build(BuildContext context) {
    final loginFormProvider = Provider.of<LoginFormProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        width: 500,
        height: 400,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Datos del Usuario\n",
                style: TextStyle(fontSize: 20),
              ),
              Text("Nombre de usuario: ${loginFormProvider.name}"),
              Text("Email:${loginFormProvider.email}"),
              Text("Contraseña:${loginFormProvider.password}"),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Datos Personales\n",
                style: TextStyle(fontSize: 20),
              ),
              Text("Nombre:"),
              Text("Apellido:"),
              Text("Ciudad:"),
              Text("Direccion"),
              Text("Codigo Postal"),
              Text("\n\n\n"),
            ],
          ),
        ),
      ),
    );
  }
}
