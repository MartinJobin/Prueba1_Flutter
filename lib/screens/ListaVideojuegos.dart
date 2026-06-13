import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_application_prueba/navigations/DrawerNavigation.dart';

class Listavideojuegos extends StatelessWidget {
  const Listavideojuegos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Videojuegos")),
      drawer: const MiDrawer(),
      body: listaVideojuegos(context),
    );
  }
}

Widget listaVideojuegos(BuildContext context) {
  String url = "https://jritsqmet.github.io/web-api/videojuegos.json";

  return FutureBuilder(
    future: leerJuegos(url),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final juego = data[index];
            return Card(
              child: ListTile(
                leading: Image.network(
                  juego['imagen'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(juego['titulo']),
                subtitle: Text("Precio: \$${juego['precio']} USD"),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(juego['titulo']),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(juego['imagen']),
                          const SizedBox(height: 10),
                          Text("Desarrollador: ${juego['desarrollador']}"),
                          Text("Precio: \$${juego['precio']} USD"),
                          Text("Género: ${juego['genero'].join(', ')}"),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cerrar"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      } else {
        return const Center(child: Text("Cargando..."));
      }
    },
  );
}

Future<List> leerJuegos(String url) async {
  final peticion = await http.get(Uri.parse(url));
  Map<String, dynamic> data = json.decode(peticion.body);
  return data['videojuegos'];
}