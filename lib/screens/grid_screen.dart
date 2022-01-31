import 'package:ecommercemobile/models/products.dart';
import 'package:ecommercemobile/models/products_.dart';
import 'package:ecommercemobile/provider/filtrado_provider.dart';
import 'package:ecommercemobile/provider/product_provider.dart';
import 'package:ecommercemobile/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';

class GridScreen extends StatelessWidget {
  GridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    final productos =
        ModalRoute.of(context)!.settings.arguments as List<Producto>;

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
        body: GridView.builder(
          itemCount: productos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (_, index) {
            if (productos.isEmpty) {
              return Center(
                child: Container(
                  child: Text("No hay producto disponible"),
                ),
              );
            }
            final producto = productos[index];

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, "detail", arguments: producto),
              child: Card(
                elevation: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 140,
                      width: double.infinity,
                      child: FadeInImage(
                        placeholder: AssetImage("assets/loading.gif"),
                        image: NetworkImage("${producto.img![0].url}"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(producto.name!),
                            Row(
                              children: [
                                Text(
                                  "\$${producto.price}",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                if (producto.discount != null)
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.green.shade500,
                                      ),
                                      child: Text(
                                        " ${producto.discount}% ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.white),
                                      ))
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
