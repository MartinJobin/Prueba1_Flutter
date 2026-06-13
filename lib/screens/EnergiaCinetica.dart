import 'package:flutter/material.dart';
import 'package:flutter_application_prueba/navigations/DrawerNavigation.dart';

class Energiacinetica extends StatefulWidget {
  const Energiacinetica({super.key});

  @override
  State<Energiacinetica> createState() => _EnergiacineticaState();
}

class _EnergiacineticaState extends State<Energiacinetica> {
  TextEditingController masa = TextEditingController();
  TextEditingController velocidad = TextEditingController();
  String _resultado = "";

  void _calcular() {
    try {
      double m = double.parse(masa.text);
      double v = double.parse(velocidad.text);
      
      if (v == 0) {
        setState(() {
          _resultado = "El objeto está en reposo (energía = 0)";
        });
      } else {
        double energia = 0.5 * m * v * v;
        setState(() {
          _resultado = "Energía Cinética: ${energia.toStringAsFixed(2)} Joules";
        });
      }
    } catch (e) {
      setState(() {
        _resultado = "Error: Ingrese valores válidos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Energía Cinética")),
      drawer: const MiDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Masa
            TextField(
              controller: masa,
              decoration: const InputDecoration(labelText: "Masa (kg)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            
       
            TextField(
              controller: velocidad,
              decoration: const InputDecoration(labelText: "Velocidad (m/s)"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            
          
            const Text(
              "Fórmula: Ec = ½ × m × v²",
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            
        
            ElevatedButton(onPressed: _calcular, child: const Text("Calcular")),
            const SizedBox(height: 20),
            
        
            Text(_resultado, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}