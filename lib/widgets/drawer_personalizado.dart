import 'package:ecommercemobile/provider/http_peticiones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpcionesDrawer extends StatelessWidget {
  const OpcionesDrawer({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        titulo,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(
        Icons.navigate_next_sharp,
        color: Colors.white,
      ),
    );
  }
}

class BuscadorIndumentaria extends StatelessWidget {
  const BuscadorIndumentaria({
    Key? key,
    required this.titulo,
    required this.rutaProvider,
  }) : super(key: key);

  final String titulo;
  final Object rutaProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed("grid", arguments: rutaProvider),
      child: Column(
        children: [
          Container(
            color: Colors.yellow.shade50.withOpacity(0.2),
            child: ListTile(
              title: Text(
                titulo,
                style: TextStyle(color: Colors.yellowAccent.shade700),
              ),
            ),
          ),
          Divider(
            height: 0.4,
          )
        ],
      ),
    );
  }
}

class DrawerPersonalizado extends StatefulWidget {
  const DrawerPersonalizado({Key? key}) : super(key: key);

  @override
  State<DrawerPersonalizado> createState() => _DrawerPersonalizadoState();
}

class _DrawerPersonalizadoState extends State<DrawerPersonalizado> {
  bool vestidos = false;
  bool remeras = false;
  bool faldas = false;
  bool pantalones = false;

  @override
  Widget build(BuildContext context) {
    final httpPeticiones = Provider.of<HttpPeticiones>(context);

    return Drawer(
      child: Container(
        color: Colors.blueGrey.shade800,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  Text(
                    "Nombre del Usuario",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed("home"),
                  child: Text("Home")),
            ),
            TextButton(
              onPressed: () {
                setState(() {});
                vestidos ? vestidos = false : vestidos = true;
              },
              child: OpcionesDrawer(
                titulo: 'Vestidos',
              ),
            ),
            if (vestidos)
              BuscadorIndumentaria(
                titulo: 'De noche',
                rutaProvider: httpPeticiones.vestidoDeNoche,
              ),
            if (vestidos)
              BuscadorIndumentaria(
                titulo: 'De dia',
                rutaProvider: httpPeticiones.vestidoDeDia,
              ),
            TextButton(
              onPressed: () {
                setState(() {});
                remeras ? remeras = false : remeras = true;
              },
              child: OpcionesDrawer(
                titulo: 'Remeras',
              ),
            ),
            if (remeras)
              BuscadorIndumentaria(
                titulo: 'Con Mangas',
                rutaProvider: httpPeticiones.remerasConMangas,
              ),
            if (remeras)
              BuscadorIndumentaria(
                titulo: 'Sin Mangas',
                rutaProvider: httpPeticiones.remerasSinMangas,
              ),
            TextButton(
              onPressed: () {
                setState(() {});
                faldas ? faldas = false : faldas = true;
              },
              child: OpcionesDrawer(
                titulo: 'Faldas',
              ),
            ),
            if (faldas)
              BuscadorIndumentaria(
                titulo: 'Cortas',
                rutaProvider: httpPeticiones.faldasCortas,
              ),
            if (faldas)
              BuscadorIndumentaria(
                titulo: 'Largas',
                rutaProvider: httpPeticiones.faldasLargas,
              ),
            TextButton(
              onPressed: () {
                setState(() {});
                pantalones ? pantalones = false : pantalones = true;
              },
              child: OpcionesDrawer(titulo: 'Pantalones'),
            ),
            if (pantalones)
              BuscadorIndumentaria(
                titulo: 'Jeans',
                rutaProvider: httpPeticiones.pantalonesJeans,
              ),
            if (pantalones)
              BuscadorIndumentaria(
                titulo: "Calza",
                rutaProvider: httpPeticiones.pantalonesCalzas,
              ),
          ],
        ),
      ),
    );
  }
}
