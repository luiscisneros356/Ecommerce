import 'dart:convert';

import 'package:ecommercemobile/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginFormProvider extends ChangeNotifier {
  LoginFormProvider() {
    // crearUsuario();
    // // createAlbum("Sui Generis");
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String _name = "Algo";
  String _email = "Algo60@correo";
  String _password = "123123";

  String get name => _name;
  String get email => _email;
  String get password => _password;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  bool esValido() {
    bool esValido = formkey.currentState?.validate() ?? false;

    return esValido;
  }

  // Future<Album> createAlbum(String title) async {
  //   final response = await http.post(
  //     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'title': title,
  //     }),
  //   );

  //   if (response.statusCode == 201) {
  //     // If the server did return a 201 CREATED response,
  //     // then parse the JSON.
  //     return Album.fromJson(jsonDecode(response.body));
  //   }

  //   final album = Album.fromJson(jsonDecode(response.body));
  //   print(album);
  //   return album;
  // }

  crearUsuario() async {
    final Map crearUsuario = {
      "juan": {"name": name, "email": email, "password": password}
    };

    //final url = Uri.http("mujeres-reales.herokuapp.com", "/api/users");

    // print(crearUsuario);

    final respuesta = await http.post(
        Uri.parse('https://mujeres-reales.herokuapp.com/api/users'),
        body: jsonEncode(crearUsuario));
    if (respuesta.statusCode != 200) {
      print(respuesta.reasonPhrase);
    }
    print(respuesta.body);

    final jsonData = jsonDecode(respuesta.body);

    // print(jsonData);

    // var request = http.Request(
    //     'POST', Uri.parse('https://mujeres-reales.herokuapp.com/api/users'));
    // request.body =
    //     '''{   "name": $name,    "email": $email,    "password": $password}''';

    // http.StreamedResponse response = await request.send();

    // return response;
    // var request = http.Request(
    //     'POST', Uri.parse('https://mujeres-reales.herokuapp.com/api/users'));
    // request.body =
    //     '''{\r\n    "name": "Juan Perez",\r\n    "email": "usuario4@gmail.com",\r\n    "password": "123456"\r\n}''';

    // http.StreamedResponse response = await request.send();
  }
}
