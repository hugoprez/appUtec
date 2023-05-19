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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text('base de datos con firebase '),
        ),

        body:FutureBuilder(
          future: getEstudiante(),
          builder: ((context,snapshot)
          {

            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                //return Text(snapshot.data?[index]['nombre']);

                        return ListTile(
                        
                           title: Text('Código: ${snapshot.data?[index]['IdUsuario']}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nombre: ${snapshot.data?[index]['NombreEstudiante']}'), 
                              Text('Apellido: ${snapshot.data?[index]['ApellidoEstudiante']}'), 
                              Text('Código de Usuario: ${snapshot.data?[index]['IdUsuario']}'),
                            ],
                          ),
                        );
                        
              },);

            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
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
      )
    );
  }
}