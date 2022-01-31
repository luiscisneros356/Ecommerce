import 'package:card_swiper/card_swiper.dart';
import 'package:ecommercemobile/models/products.dart';
import 'package:ecommercemobile/provider/filtrado_provider.dart';
import 'package:ecommercemobile/provider/product_provider.dart';
import 'package:ecommercemobile/provider/http_peticiones.dart';
import 'package:ecommercemobile/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //probando otra ves
  bool indumentaria = false;
  bool accesorios = false;
  bool colores = false;
  bool talles = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final productProvider = Provider.of<ProductProvider>(context);
    //  final filtradoProducto = Provider.of<FiltradoProducto>(context);
    final httpPeticiones = Provider.of<HttpPeticiones>(context);

    return SafeArea(
      child: Scaffold(
        drawer: DrawerPersonalizado(),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade800,
          title: Image.asset("assets/logo.jpg"),
          actions: [CarritoCompras(productProvider: productProvider)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.3,
                width: double.infinity,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, "detail"),
                      child: Image.asset("assets/${index + 19}.jpg",
                          fit: BoxFit.contain),
                    );
                  },
                  itemCount: 4,
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                ),
              ),
              SizedBox(height: height * 0.01),

              //TODO: Hacer la navegacion y enviar producto

              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("grid",
                        arguments: httpPeticiones.productosDestacados);
                  },
                  child: ImagenCategoria(
                      categoria: 'Destacados', imagenAssets: '14')),
              SizedBox(height: height * 0.01),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("grid",
                        arguments: httpPeticiones.productosDescuento);
                  },
                  child: ImagenCategoria(
                      categoria: "20%, 30%, OFF", imagenAssets: "16")),
              SizedBox(height: height * 0.01),

              SizedBox(height: height * 0.01),
              ContainerRedesSociales(
                  imagenAssets: '17', icono: Icons.photo_camera_sharp),
              SizedBox(height: height * 0.01),
              ContainerRedesSociales(
                  imagenAssets: '18', icono: Icons.local_parking_outlined),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}

class ImagenCategoria extends StatelessWidget {
  const ImagenCategoria(
      {Key? key, required this.categoria, required this.imagenAssets})
      : super(key: key);

  final String categoria;
  final String imagenAssets;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: height * 0.5,
        width: width * 0.95,
        child: Stack(
          children: [
            Container(
              height: height * 0.5,
              width: width * 1,
              child: FadeInImage(
                placeholder: AssetImage("assets/loading.gif"),
                image: AssetImage("assets/${imagenAssets}.jpg"),
                height: height * 0.5,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.yellow.shade900,
                  alignment: Alignment.center,
                  child: Text(
                    categoria,
                    style: TextStyle(color: Colors.black, fontSize: 20.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
