import 'package:flutter/material.dart';
import 'package:flutter_application_prueba/screens/Calculadoracalorias.dart';
import 'package:flutter_application_prueba/screens/Energiacinetica.dart';
import 'package:flutter_application_prueba/screens/ListaVideojuegos.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                const Text("Menu"),
                const SizedBox(height: 10),
                Container(
                  height: 80,
                  child: Image.asset(
                    "assets/images/26464.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text("Calculadora de Calorías"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Calculadoracalorias()),
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