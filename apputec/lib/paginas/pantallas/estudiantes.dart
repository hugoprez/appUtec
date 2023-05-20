import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apputec/services/firebase.dart';

class MostrarEstudiantes extends StatefulWidget {
  const MostrarEstudiantes({super.key});

  @override
  State<MostrarEstudiantes> createState() => _MostrarEstudiantesState();
}

class _MostrarEstudiantesState extends State<MostrarEstudiantes> {
  @override
  String information = '';

  void showDialogWithInformation() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Información'),
          content: Text(information),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('base de datos con firebase '),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Estudiantes",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              
              child: // Generated code for this GridView Widget...
                  GridView(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  //childAspectRatio: 1 / 1,
                ),
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                   
                    //decoration: BoxDecoration(color: Colors.red),
                    child: FutureBuilder(
                      future: getEstudiante(),
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 1,
                              childAspectRatio: 2,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                
                                /*decoration: BoxDecoration(
                                  color: Colors.yellow,
                                ),*/
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      information = '¡Has presionado el botón!';
                                    });
                                    showDialogWithInformation();
                                  },
                                  child: Card(
                                    elevation: 8.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      // decoration: BoxDecoration(color: Colors.red),
                                     
                                      child: Column(
                                        children: [
                                          Text(
                                              'Código: ${snapshot.data?[index]['IdEstudiante']}'),
                                          Text(
                                              'Nombre: ${snapshot.data?[index]['NombreEstudiante']}'),
                                          Text(
                                              'Apellido: ${snapshot.data?[index]['ApellidoEstudiante']}'),
                                          Text(
                                              'Código de Usuario: ${snapshot.data?[index]['IdUsuario']}'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          //actualiza los datos al agregar un usuario
          setState(() {});
          //print("Actualizar");
        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
