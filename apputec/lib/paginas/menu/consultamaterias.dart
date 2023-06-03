import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:apputec/services/firebase.dart';

class ConsultarMaterias extends StatefulWidget {
  const ConsultarMaterias({super.key});
  @override
  State<ConsultarMaterias> createState() => _ConsultarMateriasState();
}

class _ConsultarMateriasState extends State<ConsultarMaterias> {
  //guardo el valor de la funcion obtenerCantidadRegistros
  int cantidadRegistros = 0, cantidadNotas = 0;

  //guardamos los id de las materias de la funcion MateriasCarrerasDataById
  List<int> valoresNumericos = [];

  //Declara una variable para los datos del dropdown
  List<DropdownMenuItem<String>>? _dropDownMenuItems;

  //Declara una variable para el valor seleccionado de los dropdownlist
  String? _selectedItemtpusuario;
  String? _selectedItemcarrera;

  // variable para los combobox para
  int tpUsuarioController = 0, tpCarreraController = 0;

  // variables que controlan la altura del contenedor del formulario de ingreso de Estudiante (Expandir/reducir altura)
  double containerHeight = 273.0; // Altura inicial del contenedor
  bool expanded = false; // Estado inicial del contenedor
  bool isvisible = false; // Estado inicial del contenedor

  //Creamos los controladores de texto. Lo usaremos para Guardar los datos al firebase
  TextEditingController IdController = TextEditingController();
  TextEditingController NombreController = TextEditingController();
  TextEditingController ApellidoController = TextEditingController(text: "");
  TextEditingController CorreoController = TextEditingController();
  TextEditingController ContrasenaController = TextEditingController();

  //variable para actualizar el formulario
  int notaId = 0;
  int MateriaId = 0;

  @override
  void initState() {
    super.initState();

    //Ejecuto la funcion para obtener la cantidad de alumnos y generar el ID
    CantidadEstudiantes().then((value) {
      setState(() {
        cantidadRegistros = value;
      });
    });

    //Ejecuto la funcion para obtener la cantidad de nostas y generar el ID
    obtenerCantidadNotas().then((value) {
      setState(() {
        cantidadNotas = value;
      });
    });
  }

//funcion que recibe parametros para almacenarlos en la coleccion de Notas mediante el ID del Estudiante
  void obtenerIDMaterias(
    int Idnotas,
    int IdEstudiante,
    double notainicial,
    int tpCarreraController,
  ) {
    obtenerIdMaterias(tpCarreraController).then((result) {
      setState(() {
        valoresNumericos = result;
        int idmateria = 0;

        // Usando un bucle for para recorrer las materias de cada carrera
        for (int i = 0; i < valoresNumericos.length; i++) {
          idmateria = valoresNumericos[i];

          //enviamos los datos a la coleccion de Notas
          agregarNotas(Idnotas++, IdEstudiante, idmateria, notainicial);
        }
      });
    });
  }

  String information = '';

  //definimos las variables para almacenar las notas
  double evaluacion1Value = 0.0;
  double evaluacion2Value = 0.0;
  double evaluacion3Value = 0.0;
  double evaluacion4Value = 0.0;
  double evaluacion5Value = 0.0;

  List<double> evaluacionesList = [];
/*
  void EditarEstudiante(int estudianteid) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 300,
            height: 390,
            child: FutureBuilder<Map<String, dynamic>>(
              future: fetchDataById(estudianteid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error al obtener los datos');
                } else {
                  Map<String, dynamic> result = snapshot.data!;
                  Map<String, dynamic>? estudiante = result['Estudiante'];
                  Map<String, dynamic>? carrera = result['Carreras'];
                  Map<String, dynamic> data = snapshot.data!;
                  List<Map<String, dynamic>> materiasList = data['Materias'];

                  TextEditingController editNombreController =
                      TextEditingController();
                  TextEditingController editApellidoController =
                      TextEditingController();

                  editNombreController.text = estudiante?['NombreEstudiante'];
                  editApellidoController.text =
                      estudiante?['ApellidoEstudiante'];

                  List<Map<String, dynamic>> datosIteracion = [];

                  return Container(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 35,
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 150,
                                      child: TextFormField(
                                        controller: editNombreController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Ingrese el Nombre',
                                          labelStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(151, 0, 0, 0)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: TextFormField(
                                        controller: editApellidoController,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Ingrese el Apellido',
                                          labelStyle: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Color.fromARGB(151, 0, 0, 0)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      child: Text(
                                          'Carrera: ${carrera?['NombreCarrera']}',
                                          style: TextStyle(fontSize: 18)),
                                    ),
                                    Container(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(top: 1, bottom: 1),
                                      child: Text('Materias Inscritas',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                       
                        Positioned(
                            top: 230,
                            child: Container(
                              height: 150,
                              width: 300,
                              child: ListView.builder(
                                itemCount: materiasList.length,
                                itemBuilder: (context, index) {
                                  Map<String, dynamic> materiaData =
                                      materiasList[index]['Materia'];
                                  Map<String, dynamic> notasData =
                                      materiasList[index]['Notas'];

                                  notaId = notasData['Idnotas'];
                                  MateriaId = materiaData['IdMateria'];

                                   // Crear un mapa con los datos relevantes
                                Map<String, dynamic> iteracionData = {
                                  'materia': materiaData,
                                  'notas': notasData,
                                };

                                // Agregar el mapa a la lista
                                datosIteracion.add(iteracionData);



                                  evaluacion1Value =
                                      notasData['Evaluacion1'].toDouble();
                                  evaluacion2Value =
                                      notasData['Evaluacion2'].toDouble();
                                  evaluacion3Value =
                                      notasData['Evaluacion3'].toDouble();
                                  evaluacion4Value =
                                      notasData['Evaluacion4'].toDouble();
                                  evaluacion5Value =
                                      notasData['Evaluacion5'].toDouble();

                                  return ListTile(
                                    title: Text(materiaData['NombreMateria'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 23)),
                                    subtitle: Column(
                                      children: [
                                        Text(
                                          'ID Nota: ${notasData['Idnotas']}',
                                          style: TextStyle(fontSize: 19),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue:evaluacion1Value.toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      evaluacionesList[0] =
                                                          double.tryParse(
                                                                  value) ??
                                                              0.0;
                                                      print(
                                                          evaluacionesList[0]);
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 2',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue:
                                                      evaluacionesList[1]
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion2Value =
                                                        double.tryParse(
                                                                value) ??
                                                            0.0;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 3',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue:
                                                      evaluacionesList[2]
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion3Value =
                                                        double.tryParse(
                                                                value) ??
                                                            0.0;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 4',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue:
                                                      evaluacionesList[3]
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion4Value =
                                                        double.tryParse(
                                                                value) ??
                                                            0.0;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 5',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue:
                                                      evaluacionesList[4]
                                                          .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion5Value =
                                                        double.tryParse(
                                                                value) ??
                                                            0.0;
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200,
                                          margin: EdgeInsets.only(bottom: 35),
                                          height: 30,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Promedio ',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Text(
                                                  '${(notasData['NotaFinal'].toDouble())}',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            )),
                        Positioned(
                          bottom: 1,
                          child: ElevatedButton(
                            onPressed: () async {
                              await modificarEstudiante(
                                      estudianteid,
                                      editNombreController.text,
                                      editApellidoController.text,
                                      1)
                                  .then((_) {
                                print(datosIteracion);
                              });
                              setState(() {});

                              Navigator.of(context).pop();
                            },
                            child: Text("Actualizar"),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
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
  }*/


// Función para actualizar un campo en un mapa específico
void actualizarCampo(int indiceMapa, String campo, dynamic nuevoValor) {
  // Verificar si el índice del mapa está dentro del rango válido
  if (indiceMapa >= 0 && indiceMapa < datosIteracion.length) {
    // Obtener el mapa objetivo
    Map<String, dynamic> mapaObjetivo = datosIteracion[indiceMapa]['notas'];

    // Verificar si el campo existe en el mapa objetivo
    if (mapaObjetivo.containsKey(campo)) {
      // Modificar el campo con el nuevo valor
      mapaObjetivo[campo] = nuevoValor;
      print('Campo actualizado: $campo');
    } else {
      print('El campo especificado no existe en el mapa objetivo.');
    }
  } else {
    print('El índice del mapa está fuera del rango válido.');
  }
}

  //EDITAMOS la informacón del Estudiante
  void EditarEstudiante(int estudianteid) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 300,
            height: 390,
            child: FutureBuilder<Map<String, dynamic>>(
              future: fetchDataById(
                  estudianteid), // Llama a la función fetchDataById con el ID del estudiante
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Muestra un indicador de carga mientras se obtienen los datos
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Muestra un mensaje de error si se produce un error al obtener los datos
                  return Text('Error al obtener los datos');
                } else {
                  // Accede a los datos obtenidos en el resultado de fetchDataById
                  Map<String, dynamic> result = snapshot.data!;
                  Map<String, dynamic>? estudiante = result['Estudiante'];
                  Map<String, dynamic>? carrera = result['Carreras'];
                  //List<Map<String, dynamic>> materiasList = result['Materias'];

                  //obtenemos las materias inscritas por cada carrera
                  Map<String, dynamic> data = snapshot.data!;
                  List<Map<String, dynamic>> materiasList = data['Materias'];

                  // Crear los controladores de texto
                  TextEditingController editNombreController =
                      TextEditingController();
                  TextEditingController editApellidoController =
                      TextEditingController();

                  // Asignar los valores iniciales a los controladores de texto
                  editNombreController.text = estudiante?['NombreEstudiante'];
                  editApellidoController.text =
                      estudiante?['ApellidoEstudiante'];

                  List<Map<String, dynamic>> datosIteracion = [];

                  return Container(
                    // Muestra los datos en el contenedor
                    child: Stack(
                      children: [
                        Positioned(
                            top: 35,
                            child: Column(
                              children: [
                                Container(
                                  width: 300,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        child: TextFormField(
                                          controller: editNombreController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: 'Ingrese el Nombre',
                                            labelStyle: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    151, 0, 0, 0)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 150,
                                        child: TextFormField(
                                          controller: editApellidoController,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            labelText: 'Ingrese el Apellido',
                                            labelStyle: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    151, 0, 0, 0)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        child: Text(
                                            'Carrera: ${carrera?['NombreCarrera']}',
                                            style: TextStyle(fontSize: 18)),
                                      ),
                                      Container(
                                        height: 40,
                                        padding:
                                            EdgeInsets.only(top: 1, bottom: 1),
                                        child: Text('Materias Inscritas',
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Positioned(
                          top: 230,
                          child: Container(
                            height: 150,
                            width: 300,
                            child: ListView.builder(
                              itemCount: materiasList.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> materiaData =
                                    materiasList[index]['Materia'];
                                Map<String, dynamic> notasData =
                                    materiasList[index]['Notas'];

                                notaId = notasData['Idnotas'];
                                MateriaId = materiaData['IdMateria'];

                                // Crear un mapa con los datos relevantes
                                Map<String, dynamic> iteracionData = {
                                  'notas': notasData,
                                };

                                // Agregar el mapa a la lista
                                datosIteracion.add(iteracionData);

                                //Asignamos las notas a las variables
                                evaluacion1Value =
                                    notasData['Evaluacion1'].toDouble();
                                evaluacion2Value =
                                    notasData['Evaluacion2'].toDouble();
                                evaluacion3Value =
                                    notasData['Evaluacion3'].toDouble();
                                evaluacion4Value =
                                    notasData['Evaluacion4'].toDouble();
                                evaluacion5Value =
                                    notasData['Evaluacion5'].toDouble();

                                // Inicializar la lista con los valores iniciales
                                /*evaluacionesList = [
                            evaluacion1Value,
                            evaluacion2Value,
                            evaluacion3Value,
                            evaluacion4Value,
                            evaluacion5Value,
                          ];*/

                                print(datosIteracion);

                                return ListTile(
                                  title: Text(materiaData['NombreMateria'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 23)),
                                  subtitle: Column(
                                      
                                    
                                    children: [
                                      
                                      Text(
                'Iteración: ${index + 1}', // El número de iteración actual
                style: TextStyle(fontSize: 19),
              ),
                                      Text(
                                        'ID Nota: ${notasData['Idnotas']}',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Container(
                                          width: 200,
                                          height:
                                              30, // Establece el ancho deseado
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 1',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  //initialValue:evaluacion1Value.toString(),
                                                  initialValue: evaluacion1Value
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    // Modificar un valor específico dentro de 'notas'
                                                    notasData['clave'] = value;
                                                    /*evaluacion1Value = double
                                                            .tryParse(value) ??
                                                        0.0; */
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: 200,
                                          height:
                                              30, // Establece el ancho deseado
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 2',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue: evaluacion2Value
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion2Value = double
                                                            .tryParse(value) ??
                                                        0.0; // Guardar el nuevo valor ingresado en evaluacion1Value
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: 200,
                                          height:
                                              30, // Establece el ancho deseado
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 3',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue: evaluacion3Value
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion3Value = double
                                                            .tryParse(value) ??
                                                        0.0; // Guardar el nuevo valor ingresado en evaluacion1Value
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: 200,
                                          height:
                                              30, // Establece el ancho deseado
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 4',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue: evaluacion4Value
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion4Value = double
                                                            .tryParse(value) ??
                                                        0.0; // Guardar el nuevo valor ingresado en evaluacion1Value
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: 200,
                                          height:
                                              30, // Establece el ancho deseado
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Evaluación 5',
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: TextFormField(
                                                  initialValue: evaluacion5Value
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 19),
                                                  onChanged: (value) {
                                                    evaluacion5Value = double
                                                            .tryParse(value) ??
                                                        0.0; // Guardar el nuevo valor ingresado en evaluacion1Value
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                      Container(
                                          width: 200,
                                          margin: EdgeInsets.only(bottom: 35),
                                          height:
                                              30, // Establece el ancho deseado
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 130,
                                                height: 50,
                                                child: Text(
                                                  'Promedio ',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                width: 50,
                                                height: 50,
                                                child: Text(
                                                  '${(notasData['NotaFinal'].toDouble())}',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 1,
                          child: ElevatedButton(
                              onPressed: () async {
                                //IdEstudiante, NombreEstudiante, ApellidoEstudiante, IdUsuario
                                await modificarEstudiante(
                                        estudianteid,
                                        editNombreController.text,
                                        editApellidoController.text,
                                        1)
                                    .then((_) {
                                  // Enviar datos a la colección "Usuario"
                                  /*agregarUsuario(
                                        (cantidadRegistros + 1),
                                        CorreoController.text,
                                        ContrasenaController.text,
                                        tpUsuarioController);*/

                                  //enviamos los parametros a la funcion que agregar las notas al estudiante ingresado
                                  //notaId,IdEstudiante,IdMateria,evaluacion1,evaluacion2,evaluacion3,evaluacion4,evaluacion5,notaFinal
                                  //modificarNotas(notaId,estudianteid,MateriaId,evaluacion1Value);

                                  print(datosIteracion);
                                });
                                setState(() {});

                                Navigator.of(context).pop();
                              },
                              child: Text("Actualizar")),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
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

//MOSTRAR registros CODIGO BUENO
  void showDialogWithInformation(int estudianteid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: 300,
            height: 390,
            child: FutureBuilder<Map<String, dynamic>>(
              future: fetchDataById(
                  estudianteid), // Llama a la función fetchDataById con el ID del estudiante
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Muestra un indicador de carga mientras se obtienen los datos
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Muestra un mensaje de error si se produce un error al obtener los datos
                  return Text('Error al obtener los datos');
                } else {
                  // Accede a los datos obtenidos en el resultado de fetchDataById
                  Map<String, dynamic> result = snapshot.data!;
                  Map<String, dynamic>? estudiante = result['Estudiante'];
                  Map<String, dynamic>? carrera = result['Carreras'];
                  //List<Map<String, dynamic>> materiasList = result['Materias'];

                  Map<String, dynamic> data = snapshot.data!;
                  List<Map<String, dynamic>> materiasList = data['Materias'];

                  //List<Map<String, dynamic>> notasList = result['Notas'];

                  return Container(
                    // Muestra los datos en el contenedor
                    child: Stack(
                      children: [
                        Positioned(
                            top: 35,
                            child: Column(
                              children: [
                                Container(
                                  width: 300,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: 30,
                                        child: Text(
                                            '${estudiante?['NombreEstudiante']}',
                                            style: TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      Container(
                                        height: 60,
                                        child: Text(
                                            '${estudiante?['ApellidoEstudiante']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800)),
                                      ),
                                      Container(
                                        height: 40,
                                        child: Text(
                                            'Carrera: ${carrera?['NombreCarrera']}',
                                            style: TextStyle(fontSize: 18)),
                                      ),
                                      Container(
                                        height: 40,
                                        padding:
                                            EdgeInsets.only(top: 1, bottom: 1),
                                        child: Text('Materias Inscritas',
                                            style: TextStyle(fontSize: 20)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Positioned(
                          top: 200,
                          child: Container(
                            height: 200,
                            width: 300,
                            child: ListView.builder(
                              itemCount: materiasList.length,
                              itemBuilder: (context, index) {
                                Map<String, dynamic> materiaData =
                                    materiasList[index]['Materia'];
                                Map<String, dynamic> notasData =
                                    materiasList[index]['Notas'];
                                return ListTile(
                                  title: Text(materiaData['NombreMateria'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 23)),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        'Evaluación 1: ${notasData['Evaluacion1'].toDouble()}',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        'Evaluación 2: ${notasData['Evaluacion2'].toDouble()}',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        'Evaluación 3: ${notasData['Evaluacion3'].toDouble()}',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        'Evaluación 4: ${notasData['Evaluacion4'].toDouble()}',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        'Evaluación 5: ${notasData['Evaluacion5'].toDouble()}',
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        'Promedio: ${(notasData['NotaFinal'].toDouble())}',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Positioned(
                            top: 1,
                            left: 250,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 240, 162, 156),
                              ),
                              child: IconButton(
                                color: Colors.white,
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // Llamar a una función y pasar el parámetro
                                  EditarEstudiante(estudiante?['IdEstudiante']);

                                  // Ocultar el botón al activar el modal
                                },
                              ),
                            ))

                        /*Container(
                          height: 200,
                          width: 500,
                          //color: Colors.red,

                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: materiasList.length,
                                  itemBuilder: (context, index) {
                                    Map<String, dynamic> materia =
                                        materiasList[index];
                                    return Column(
                                      children: [
                                        Container(
                                          height: 30,
                                          padding: EdgeInsets.only(
                                              top: 2,
                                              bottom: 2,
                                              right: 8,
                                              left: 8),
                                          child: Text(materia['NombreMateria']?? '',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                        ),
                                        Text(materia['Evaluacion1'].toString()),
                                        Text(materia['Evaluacion2'].toString()),
                                        Text(materia['Evaluacion3'].toString()),
                                        Text(materia['Evaluacion4'].toString()),
                                        Text(materia['Evaluacion5'].toString()),

                                        
                                        Text(
                                          '${(materia['Evaluacion1'].toDouble()+
                                          materia['Evaluacion2'].toDouble()+
                                          materia['Evaluacion3'].toDouble()+
                                          materia['Evaluacion4'].toDouble()+
                                          materia['Evaluacion5'].toDouble())/5}'
                                        .toString(),style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 23,
                                              fontFamily: 'Roboto',
                                            ))
                                      
                                      ],
                                    );
                                  },
                                ),
                              )
                          ]),
                        ),*/
                      ],
                    ),
                  );
                }
              },
            ),
          ),
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

  void toggleContainer() {
    setState(() {
      if (expanded) {
        containerHeight = 440.0; // Altura contraída
        expanded = false;
        isvisible = true;
      } else {
        containerHeight = 273.0; // Altura expandida
        expanded = true;
        isvisible = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF5D0A28),
      body: Container(
          child: Column(
        children: [
          AnimatedContainer(
            //padding: EdgeInsets.only(bottom: 20),
            duration: Duration(milliseconds: 500), // Duración de la animación
            height: containerHeight,
            child: Container(
              //color: Colors.red,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 185, 184, 184),
                  borderRadius: BorderRadius.circular(45)),
              height: 250,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                    //color: Color.fromARGB(255, 124, 244, 54),
                    height: 273,
                    child: Center(
                        child: Column(
                      children: [
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
                        TextFormField(
                          controller: CorreoController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Ingrese el Correo',
                          ),
                        ),
                        TextFormField(
                          controller: ContrasenaController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Ingrese la Contraseña',
                          ),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    child: Center(
                      child: ElevatedButton(
                        onPressed: toggleContainer,
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    color: Color.fromARGB(255, 172, 170, 170),
                    height: 50,
                  ),
                  Positioned(
                      top: 275,
                      left: 50,
                      child: Container(
                        color: Color.fromARGB(255, 185, 184, 184),
                        height: 300,
                        width: 350,
                        child: Column(
                          children: [
                            Center(
                              child: FutureBuilder<List<Map<String, dynamic>>>(
                                // Llama a la función getEstudiantesDrow() para obtener los datos de Firebase
                                future: getTpUsuario(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    // Asigna los datos obtenidos a la variable del dropdown
                                    _dropDownMenuItems =
                                        snapshot.data!.map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e['id'].toString(),
                                        child: Text(e['nombre']),
                                      );
                                    }).toList();
                                    // Crea el DropdownButtonFormField con las opciones
                                    return DropdownButtonFormField<String>(
                                      value: _selectedItemtpusuario,
                                      items: _dropDownMenuItems,
                                      onChanged: (String? value) {
                                        // Cuando cambia el valor, actualiza el estado
                                        setState(() {
                                          _selectedItemtpusuario = value;
                                          // Busca el item seleccionado en la lista de items
                                          tpUsuarioController =
                                              int.parse(value.toString());
                                        });
                                      },
                                      hint:
                                          Text('Seleccione el Tipo de Usuario'),
                                    );
                                  } else if (snapshot.hasError) {
                                    // Si hay un error, muestra un mensaje
                                    return Text(
                                        'Ocurrió un error al obtener los datos');
                                  } else {
                                    // Si no hay datos, muestra un indicador de carga
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                            Center(
                              child: FutureBuilder<List<Map<String, dynamic>>>(
                                // Llama a la función getEstudiantesDrow() para obtener los datos de Firebase
                                future: getcarrera(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    // Asigna los datos obtenidos a la variable del dropdown
                                    _dropDownMenuItems =
                                        snapshot.data!.map((e) {
                                      return DropdownMenuItem<String>(
                                        value: e['id'].toString(),
                                        child: Text(e['nombre']),
                                      );
                                    }).toList();
                                    // Crea el DropdownButtonFormField con las opciones
                                    return DropdownButtonFormField<String>(
                                      value: _selectedItemcarrera,
                                      items: _dropDownMenuItems,
                                      onChanged: (String? value) {
                                        // Cuando cambia el valor, actualiza el estado
                                        setState(() {
                                          _selectedItemcarrera = value;
                                          tpCarreraController =
                                              int.parse(value.toString());
                                        });
                                      },
                                      hint: Text('Seleccione la Carrera'),
                                    );
                                  } else if (snapshot.hasError) {
                                    // Si hay un error, muestra un mensaje
                                    return Text(
                                        'Ocurrió un error al obtener los datos');
                                  } else {
                                    // Si no hay datos, muestra un indicador de carga
                                    return CircularProgressIndicator();
                                  }
                                },
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  await agregarEstudiante(
                                          (cantidadRegistros + 1),
                                          NombreController.text,
                                          ApellidoController.text,
                                          (cantidadRegistros + 1))
                                      .then((_) {
                                    // Enviar datos a la colección "Usuario"
                                    agregarUsuario(
                                        (cantidadRegistros + 1),
                                        CorreoController.text,
                                        ContrasenaController.text,
                                        tpUsuarioController);

                                    // Enviar datos a la colección intermedia CarreraEstudiante
                                    agregarCarreraEstudiante(
                                        (cantidadRegistros + 1),
                                        (cantidadRegistros + 1),
                                        tpCarreraController,
                                        1);

                                    //enviamos los parametros a la funcion que agregar las notas al estudiante ingresado
                                    obtenerIDMaterias(
                                        (cantidadNotas + 1),
                                        (cantidadRegistros + 1),
                                        0,
                                        tpCarreraController);

                                    setState(() {
                                      //actualizamos las funciones
                                      getEstudiante();
                                    });

                                    //actualizo el estado de la funcion
                                    CantidadEstudiantes().then((value) {
                                      setState(() {
                                        cantidadRegistros = value;
                                      });
                                    });
                                    //Ejecuto la funcion para obtener la cantidad de nostas y generar el ID
                                    obtenerCantidadNotas().then((value) {
                                      setState(() {
                                        cantidadNotas = value;
                                      });
                                    });
                                  });
                                },
                                child: Text("Guardar registro")),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                /*Text('Total de Estudiantes: ${cantidadRegistros}'),
                 //Text('Valor del Estudiantes incrementando : ${cantidadRegistros+1}'),
                 Text('Cantidad de notas Existentes : ${ cantidadNotas }'),
                 Text('${valoresNumericos}'),*/

                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Estudiantes",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
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
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          information =
                                              '¡Has presionado el botón!';
                                        });
                                        showDialogWithInformation(snapshot
                                            .data?[index]['IdEstudiante']);

                                        // Llamar a una función y pasar el parámetro
                                        /*EditarEstudiante(
                                            snapshot.data?[index]
                                                ['IdEstudiante']);*/
                                      },
                                      child: Card(
                                        elevation: 8.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(20),
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
              ],
            ),
          )
        ],
      )),
    );
  }
}
