import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apputec/services/firebase.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        title: Text('base de datos con firebase '),
        ),

        body:FutureBuilder(
          future: getUsuarios(),
          builder: ((context,snapshot)
          {

            if(snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                //return Text(snapshot.data?[index]['nombre']);

                        return Dismissible(
                         confirmDismiss: (direction) async{
                          return true;
                         },

                        background: 
                          Container(
                             color: Colors.red,
                            child: Icon(Icons.delete),
                           
                          ),
                          direction: DismissDirection.endToStart,

                          key:snapshot.data?[index]['uid'],
                          child:ListTile(
                          title: Text(snapshot.data?[index]['nombre']),
                          /* onTap: (() async {
                            print(Text(snapshot.data?[index]['nombre']));
                            print(context);
                            Navigator.pushNamed(context, '/edit',
                                arguments:/* {
                                  "nombre":snapshot.data?[index]['nombre']
                                }*/
                               // ArgumentoEditar()
                                );
                          }),*/

                         onTap: (() async{
                           await Navigator.pushNamed(context, '/edit',arguments: {
                            'nombre': snapshot.data?[index]['nombre'],
                            'uid': snapshot.data?[index]['uid']
                           });

                           setState(() {
                             
                           });
                          }),
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