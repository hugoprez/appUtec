import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apputec/services/firebase.dart';

class addestudiante extends StatefulWidget {
  const addestudiante({super.key});

  @override
  State<addestudiante> createState() => _addestudianteState();
}

class _addestudianteState extends State<addestudiante> {
  TextEditingController IdController = TextEditingController();
  TextEditingController NombreController = TextEditingController(text: "");
  TextEditingController ApellidoController = TextEditingController(text: "");
  TextEditingController tpUsuarioController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agergar Estudiante"),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Center(
              child: const Text(
                'pagina agregar Estudiante',
                style: TextStyle(fontSize: 24),
              ),
            ),
            TextFormField(
              controller: IdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Ingrese un número entero',
              ),
              
            ),
            /*TextField(
              controller: IdController,
              decoration:
                  InputDecoration(hintText: 'Ingrese el código del estudiante'),
            ),*/
            TextField(
              controller: NombreController,
              decoration: InputDecoration(hintText: 'Ingrese el nombre'),
            ),
            TextField(
              controller: ApellidoController,
              decoration: InputDecoration(hintText: 'Ingrese el apellido'),
            ),
            TextField(
              controller: tpUsuarioController,
              decoration:
                  InputDecoration(hintText: 'Ingrese el tipo de usuario'),
            ),
            ElevatedButton(
                onPressed: () async {
             
                  await agregarEstudiante(int.parse(IdController.text), NombreController.text,
                          ApellidoController.text,int.parse(IdController.text))
                      .then((_) {
                    Navigator.pop(context);
                  });
                  //   Navigator.pop(context);
                  setState(() {});
                },
                child: Text("Guardar registro"))
          ],
        ),
      ),
    );
  }
}
