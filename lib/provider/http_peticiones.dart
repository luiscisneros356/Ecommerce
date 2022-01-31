import 'dart:convert';

import 'package:ecommercemobile/models/products.dart';
import 'package:ecommercemobile/models/products_.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPeticiones extends ChangeNotifier {
  HttpPeticiones() {
    destacados();
    descuento();
    productoCategoriaRemerasConMangas();
    productoCategoriaRemerasSinMangas();
    productoCategoriaFaldasCortas();
    productoCategoriaFaldasLargas();
    productoCategoriaPantalonCalza();
    productoCategoriaPantalonJean();
    productoCategoriaVestidoDia();
    productoCategoriaVestidoNoche();
  }

//String category, String subcategory, List<Producto> categoriaProducto

  List<Producto> productosDestacados = [];
  List<Producto> productosDescuento = [];
  List<Producto> vestidoDeDia = [];
  List<Producto> vestidoDeNoche = [];
  List<Producto> remerasConMangas = [];
  List<Producto> remerasSinMangas = [];
  List<Producto> faldasCortas = [];
  List<Producto> faldasLargas = [];
  List<Producto> pantalonesJeans = [];
  List<Producto> pantalonesCalzas = [];

  destacados() async {
    final url =
        Uri.http("mujeres-reales.herokuapp.com", "/api/products/destacados");
    final respuesta = await http.get(url);
    final List<Producto> producto = respuestaFromMap(respuesta.body);
    productosDestacados = producto;
  }

  descuento() async {
    final url =
        Uri.http("mujeres-reales.herokuapp.com", "/api/products/discount");
    final respuesta = await http.get(url);
    final List<Producto> producto = respuestaFromMap(respuesta.body);
    productosDescuento = producto;
  }

  productoCategoriaRemerasConMangas() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "T-SHIRT", "subcategory": "CON MANGAS"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    remerasConMangas = tempProduct;
  }

  productoCategoriaRemerasSinMangas() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "T-SHIRT", "subcategory": "SIN MANGAS"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    remerasSinMangas = tempProduct;
  }

  productoCategoriaVestidoDia() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "DRESS", "subcategory": "DE DIA"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    vestidoDeDia = tempProduct;
  }

  productoCategoriaVestidoNoche() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "DRESS", "subcategory": "DE NOCHE"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    vestidoDeNoche = tempProduct;
  }

  productoCategoriaFaldasCortas() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "SKIRT", "subcategory": "CORTAS"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    faldasCortas = tempProduct;
  }

  productoCategoriaFaldasLargas() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "SKIRT", "subcategory": "LARGAS"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    faldasLargas = tempProduct;
  }

  productoCategoriaPantalonJean() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "PANT", "subcategory": "JEANS"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    pantalonesJeans = tempProduct;
  }

  productoCategoriaPantalonCalza() async {
    final url = Uri.http("mujeres-reales.herokuapp.com", "/api/products/",
        {"category": "PANT", "subcategory": "CALZAS"});
    final respuesta = await http.get(url);
    final Map<String, dynamic> respuestaJson = jsonDecode(respuesta.body);
    //print(respuestaJson["products"]);

    List<Producto> tempProduct = [];
    for (var item in respuestaJson["products"]) {
      tempProduct.add(Producto.fromMap(item));
    }
    pantalonesCalzas = tempProduct;
  }
}
