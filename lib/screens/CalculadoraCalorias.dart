import 'package:flutter/material.dart';
import 'package:flutter_application_prueba/navigations/DrawerNavigation.dart';

class Calculadoracalorias extends StatefulWidget {
  const Calculadoracalorias({super.key});

  @override
  State<Calculadoracalorias> createState() => _CalculadoracaloriasState();
}

class _CalculadoracaloriasState extends State<Calculadoracalorias> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  TextEditingController edad = TextEditingController();
  
  String _genero = "hombre";
  String _nivelActividad = "sedentario";
  String _resultado = "";
  
  // Factores de actividad
  final Map<String, double> factores = {
    "sedentario": 1.2,
    "ligero": 1.375,
    "moderado": 1.55,
    "activo": 1.725,
    "muy activo": 1.9,
  };

  void _calcular() {
    try {
      double p = double.parse(peso.text);
      double a = double.parse(altura.text);
      int e = int.parse(edad.text);
      
      
      double tmb;
      if (_genero == "hombre") {
        tmb = 10 * p + 6.25 * a - 5 * e + 5;
      } else {
        tmb = 10 * p + 6.25 * a - 5 * e - 161;
      }
      
     
      double calorias = tmb * factores[_nivelActividad]!;
      
      setState(() {
        _resultado = "Calorías diarias: ${calorias.toStringAsFixed(0)} kcal";
      });
    } catch (e) {
      setState(() {
        _resultado = "Error: Complete todos los campos";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de Calorías")),
      drawer: const MiDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Peso
              TextField(
                controller: peso, 
                decoration: const InputDecoration(labelText: "Peso (kg)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              
              // Altura
              TextField(
                controller: altura, 
                decoration: const InputDecoration(labelText: "Altura (cm)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              
              // Edad
              TextField(
                controller: edad, 
                decoration: const InputDecoration(labelText: "Edad (años)"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              
              // Género
              const Text("Género:", style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text("Hombre"),
                    selected: _genero == "hombre",
                    onSelected: (selected) {
                      if (selected) setState(() => _genero = "hombre");
                    },
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text("Mujer"),
                    selected: _genero == "mujer",
                    onSelected: (selected) {
                      if (selected) setState(() => _genero = "mujer");
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              
           
              const Text("Nivel de actividad:", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Wrap(
                spacing: 8,
                children: factores.keys.map((nivel) {
                  return ChoiceChip(
                    label: Text(nivel),
                    selected: _nivelActividad == nivel,
                    onSelected: (selected) {
                      if (selected) setState(() => _nivelActividad = nivel);
                    },
                  );
                }).toList(),
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _calcular, child: const Text("Calcular")),
              const SizedBox(height: 20),
              Text(_resultado, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}