import 'dart:ui';

import 'package:ecommercemobile/models/products.dart';
import 'package:ecommercemobile/models/products_.dart';
import 'package:ecommercemobile/provider/product_provider.dart';
import 'package:ecommercemobile/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int cantidad = 0;

  bool aumentar = false;
  bool aumentar1 = false;
  bool aumentar2 = false;
  bool aumentar3 = false;
  bool seleccionar = false;
  bool seleccionar1 = false;
  bool seleccionar2 = false;
  bool seleccionar3 = false;
  List<String> talle = [];
  String colorSeleccionado = "";
  int imagen = 0;

  @override
  Widget build(BuildContext context) {
    final Producto producto =
        ModalRoute.of(context)!.settings.arguments as Producto;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          aumentar = !aumentar;
                          aumentar1 = false;
                          aumentar2 = false;
                          aumentar3 = false;
                        },
                        child: Container(
                          height: 500,
                          width: 500,
                          // child: ImagenPrincipal(
                          //   imagenAssets: producto.imagen,
                          // ),

                          child: Stack(
                            children: [
                              Container(
                                child: Image.network("${producto.img![0].url}"),
                              ),
                              if (aumentar1)
                                Container(
                                  child:
                                      Image.network("${producto.img![1].url}"),
                                ),
                              if (aumentar2)
                                Container(
                                  child:
                                      Image.network("${producto.img![2].url}"),
                                ),
                              if (aumentar3)
                                Container(
                                  child:
                                      Image.network("${producto.img![3].url}"),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imagen = 1;

                              aumentar1 = !aumentar1;
                              aumentar = false;
                              aumentar2 = false;
                              aumentar3 = false;
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: FadeInImage(
                                placeholder: AssetImage("assets/loading.gif"),
                                image: NetworkImage("${producto.img![1].url}"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imagen = 2;
                              print(imagen);
                              aumentar2 = !aumentar2;
                              aumentar1 = false;
                              aumentar = false;
                              aumentar3 = false;
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: FadeInImage(
                                placeholder: AssetImage("assets/loading.gif"),
                                image: NetworkImage("${producto.img![2].url}"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              imagen = 3;
                              print(imagen);
                              aumentar3 = !aumentar3;
                              aumentar1 = false;
                              aumentar2 = false;
                              aumentar = false;
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            child: FadeInImage(
                              placeholder: AssetImage("assets/loading.gif"),
                              image: NetworkImage("${producto.img![3].url}"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        producto.name ?? "",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(producto.description ?? "",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.justify),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text("\$ ${producto.price} ARS",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 50,
                      height: 55,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: producto.talle!.length,
                          itemBuilder: (BuildContext context, int index) {
                            //if (producto.discount != null)
                            return GestureDetector(
                              onTap: () {
                                seleccionar3 = !seleccionar3;
                                seleccionar2 = false;
                                setState(() {});
                              },
                              child: BotonColorTalle(
                                color1: seleccionar3
                                    ? Colors.yellow.shade800
                                    : Colors.blueGrey.shade700,
                                child: Text(producto.talle![index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: seleccionar3
                                            ? Colors.blueGrey.shade700
                                            : Colors.white)),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Cantidad",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: Card(
                        child: Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (cantidad == 0) return;
                                      cantidad--;
                                    });
                                  }),
                              Text(
                                "$cantidad",
                                style: TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      cantidad++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 20,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {});
                        mostradDialogoCompra(
                          context,
                          producto,
                          cantidad,
                        );
                      },
                      child: Container(
                          width: 128,
                          height: 40,
                          alignment: Alignment.center,
                          child: Text("Comprar")),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {});
                        Navigator.pushNamed(context, "home");
                      },
                      child: Container(
                          width: 128,
                          height: 40,
                          alignment: Alignment.center,
                          child: Text("Volver a la tienda")),
                    ),
                  ],
                ),
              ),
              //FooterPersonalizado()
              SizedBox(
                height: 50,
              ),
              ContainerRedesSociales(
                  imagenAssets: '17', icono: Icons.photo_camera_sharp),
              SizedBox(height: 10),
              ContainerRedesSociales(
                  imagenAssets: '18', icono: Icons.local_parking_outlined),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> mostradDialogoCompra(
    BuildContext context,
    Producto producto,
    int cantidad,
  ) {
    // String talleSeleccionado) {
    return showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black12,
          child: AlertDialog(
            content: Container(
              height: 250,
              width: 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 230),
                    child: IconButton(
                      icon: Icon(Icons.cancel_outlined),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        color: Colors.grey,
                        child: FadeInImage(
                            placeholder: AssetImage("assets/loading.gif"),
                            image: NetworkImage(producto.img![0].url)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Producto:"),
                          Text(
                            "${producto.name}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Precio:"),
                          Text(
                            "\$${producto.price} ARS",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Text(
                            "Cantidad: ${cantidad}",
                          ),
                          //Text("Talle: ${talleSeleccionado}")
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        final productProvider = Provider.of<ProductProvider>(
                            context,
                            listen: false);

                        setState(() {
                          productProvider.carritoItem++;
                          productProvider.productsList.add(producto);
                          productProvider.cantidadProducto.add(cantidad);
                          // productProvider.talleSeleccionado
                          //     .add(talleSeleccionado);
                          productProvider.pagoTotal +=
                              producto.price! * cantidad;
                        });
                      },
                      child: Text("Agregar al carrito")),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                      onPressed: () {
                        Navigator.pushNamed(context, "home");
                      },
                      child: Text("Seguir Comprando"))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BotonColorTalle extends StatelessWidget {
  const BotonColorTalle({
    Key? key,
    this.child,
    this.color1 = Colors.black,
  }) : super(key: key);

  final Color color1;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color1,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(child: child),
    );
  }
}

class ImagenPrincipal extends StatelessWidget {
  const ImagenPrincipal({
    Key? key,
    required this.imagenAssets,
  }) : super(key: key);

  final String imagenAssets;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.5,
      width: width * 0.5,
      child: FadeInImage(
        placeholder: AssetImage("assets/loading.gif"),
        image: AssetImage(imagenAssets),
      ),
    );
  }
}
