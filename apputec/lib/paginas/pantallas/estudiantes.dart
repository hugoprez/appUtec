import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apputec/services/firebase.dart';

class MostrarEstudiantes extends StatefulWidget {
  const MostrarEstudiantes({super.key});

  @override
  State<MostrarEstudiantes> createState() => _MostrarEstudiantesState();
}

class _MostrarEstudiantesState extends State<MostrarEstudiantes> {
  TextEditingController IdController = TextEditingController();
  TextEditingController NombreController = TextEditingController(text: "");
  TextEditingController ApellidoController = TextEditingController(text: "");
  TextEditingController tpUsuarioController = TextEditingController();

  double containerHeight = 100.0; // Altura inicial del contenedor
  bool expanded = false; // Estado inicial del contenedor
  bool isvisible = false; // Estado inicial del contenedor

  void toggleContainer() {
    setState(() {
      if (expanded) {
        containerHeight = 100.0; // Altura contraída
        expanded = false;
        isvisible = false;
      } else {
        containerHeight = 260.0; // Altura expandida
        expanded = true;
        isvisible = true;
      }
    });
  }

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
      body: Container(
        child: Column(
          children: [
            Center(
                child: Container(
              padding: EdgeInsets.only(top: 15),
              child: const Text(
                'pagina agregar Estudiante',
                style: TextStyle(fontSize: 24),
              ),
            )),
            Column(
              children: [
                ElevatedButton(
                  onPressed: toggleContainer,
                  child: Text('Expandir/Contraer'),
                ),
                AnimatedContainer(
                  //padding: EdgeInsets.only(bottom: 20),
                  duration:
                      Duration(milliseconds: 500), // Duración de la animación
                  height: containerHeight,
                  color: Colors.blue,
                  child: Container(
                    child: FractionallySizedBox(
                      widthFactor:
                          1.0, // Hace que el OverflowBox ocupe todo el ancho disponible
                      child: OverflowBox(
                        alignment: Alignment.topCenter,
                        maxWidth: double
                            .infinity, // Establece el ancho máximo del OverflowBox

                        child: Container(
                          //height: 500,
                          padding: EdgeInsets.only(bottom: 10),
                          width: 100,
                          color: Color.fromARGB(255, 243, 177, 33),
                          child: Column(
                            children: [
                              Container(
                                //height: 500,
                                width: 500,
                                color: Colors.red[300],
                                child: Container(
                                  width: 100,
                                  //height: 500,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: IdController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Código',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: NombreController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Ingrese el Nombre',
                                        ),
                                      ),
                                      TextFormField(
                                        controller: ApellidoController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Ingrese el Apellido',
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                        visible: isvisible,
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 900),
                                          //width: isvisible ? 200 : 0,
                                          padding: EdgeInsets.only(top: 50,bottom: 50),
                                          height: 500,
                                          color:
                                              Color.fromARGB(255, 33, 243, 145),
                                          child: Column(
                                            children: [
                                              TextFormField(
                                                controller: IdController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText: 'Código',
                                                ),
                                              ),
                                              TextFormField(
                                                controller: NombreController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Ingrese el Nombre',
                                                ),
                                              ),
                                              TextFormField(
                                                controller: ApellidoController,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Ingrese el Apellido',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  /*
                      child: OverflowBox(
                        alignment: Alignment.topCenter,
                        maxHeight: 100.0,
                        maxWidth: 100,
                        child: Container(
                          width: 500.0,
                          height: 265.0,
                          color: Colors.red,
                          child: Container(
                            child: Column(
                            children: [
                            TextFormField(
                              controller: IdController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Ingrese un número entero',
                              ),
                            ),
                            TextField(
                              controller: NombreController,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese el nombre'),
                            ),
                            TextField(
                              controller: ApellidoController,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese el apellido'),
                            ),
                            TextField(
                              controller: tpUsuarioController,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese el tipo de usuario'),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await agregarEstudiante(
                                          int.parse(IdController.text),
                                          NombreController.text,
                                          ApellidoController.text,
                                          int.parse(IdController.text))
                                      .then((_) {
                                    //Navigator.pop(context);
                                    setState(() {});
                                  });
                                  //   Navigator.pop(context);
                                  /*setState(() {});
                                  setState(() {
                                    getEstudiante();
                                  });*/
                                },
                                child: Text("Guardar registro")),
                          ],
                        ),
                          ),
                        ),
                      ),*/
                ),

               
              ],
            ),

            /*child: Column(
                          children: [
                            TextFormField(
                              controller: IdController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Ingrese un número entero',
                              ),
                            ),
                            TextField(
                              controller: NombreController,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese el nombre'),
                            ),
                            TextField(
                              controller: ApellidoController,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese el apellido'),
                            ),
                            TextField(
                              controller: tpUsuarioController,
                              decoration: InputDecoration(
                                  hintText: 'Ingrese el tipo de usuario'),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await agregarEstudiante(
                                          int.parse(IdController.text),
                                          NombreController.text,
                                          ApellidoController.text,
                                          int.parse(IdController.text))
                                      .then((_) {
                                    //Navigator.pop(context);
                                    setState(() {});
                                  });
                                  //   Navigator.pop(context);
                                  /*setState(() {});
                                  setState(() {
                                    getEstudiante();
                                  });*/
                                },
                                child: Text("Guardar registro")),
                          ],
                        ),*/
            Container(
              padding: EdgeInsets.only(top: 75),
              child: Text(
                "Estudiantes",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Expanded(
              //padding: EdgeInsets.all(15),
              child: GridView(
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
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.only(bottom: 100),
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
            /*Expanded(
              
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
            ),*/
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          //actualiza los datos al agregar un usuario
          setState(() {});
          //print("Actualizar");
        },
        backgroundColor: Color(0xFF9D5871),
        child: Icon(Icons.add),
      ),*/
    ));
  }
}
