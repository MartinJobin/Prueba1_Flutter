import 'package:flutter/material.dart';
import 'package:flutter_application_prueba/screens/CalculadoraCalorias.dart';
import 'package:flutter_application_prueba/screens/EnergiaCinetica.dart';
import 'package:flutter_application_prueba/screens/ListaVideojuegos.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Examen"),
        // BOTÓN DE INFORMACIÓN EN LA BARRA SUPERIOR
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Información"),
                    content: const Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Título: Ejercicios de Programación"),
                        SizedBox(height: 5),
                        Text("Programador: Juan Paz"),
                        SizedBox(height: 5),
                        Text("Carrera: Desarrollo de Software"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cerrar"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: const MiDrawer(),
      body: const Center(
        child: Text("Seleccione una opción del menú"),
      ),
    );
  }
}

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                Text("Menu"),
              ],
            ),
          ),
          ListTile(
            title: const Text("Calculadora de Calorías"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculadoracalorias())
              );
            },
          ),
          ListTile(
            title: const Text("Energía Cinética"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Energiacinetica()),
              );
            },
          ),
          ListTile(
            title: const Text("Lista de Videojuegos"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Listavideojuegos()),
              );
            },
          ),
        ],
      ),
      
    );
  }
}