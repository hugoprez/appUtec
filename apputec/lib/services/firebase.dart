import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore base = FirebaseFirestore.instance;


  int idCarrera=0, idEstudiante=0, idMateria=0;

Future<List> getUsuarios() async {
  List users = [];

  CollectionReference CollectionReferenceUsuarios = base.collection('Usuario');
  QuerySnapshot queryusuarios = await CollectionReferenceUsuarios.get();
  queryusuarios.docs.forEach((documentos) {
    users.add(documentos.data());
  });
  return users;
}

//guardar usuario
Future<void> agregarUsuario(int IdUsuario, String CorreoUsuario,
    String ContrasenaUsuario, int IdTipoUsuario) async {
  await base.collection('Usuario').add({
    "IdUsuario": IdUsuario,
    "CorreoUsuario": CorreoUsuario,
    "ContrasenaUsuario": ContrasenaUsuario,
    "IdTipoUsuario": IdTipoUsuario
  });
}

//guardar Estudiante
Future<void> agregarEstudiante(int IdEstudiante, String NombreEstudiante,
    String ApellidoEstudiante, int IdUsuario) async {
  await base.collection('Estudiante').add({
    "IdEstudiante": IdEstudiante,
    "NombreEstudiante": NombreEstudiante,
    "ApellidoEstudiante": ApellidoEstudiante,
    "IdUsuario": IdUsuario
  });
}

//guardar datos en la tabla intermedia CarreraEstudiante
Future<void> agregarCarreraEstudiante(int IdCarreraEstudiante, int IdEstudiante,
    int IdCarrera, int IdFacultad) async {
  await base.collection('CarreraEstudiante').add({
    "IdCarreraEstudiante": IdCarreraEstudiante,
    "IdEstudiante": IdEstudiante,
    "IdCarrera": IdCarrera,
    "IdFacultad": IdFacultad
  });
}

//obtener todos los estudiantes
Future<List> getEstudiante() async {
  List students = [];

  CollectionReference CollectionReferenceEstudiante =
      base.collection('Estudiante');
  QuerySnapshot queryestudiante = await CollectionReferenceEstudiante.get();
  queryestudiante.docs.forEach((documentos) {
    students.add(documentos.data());
  });
  return students;
}

//obtener estudiante por ID
Future<List> getEstudiantesPorid(int id) async {
  List estudiante = [];

  CollectionReference coleccionEstudiantes = base.collection('Estudiante');
  QuerySnapshot consultaEstudiantes =
      await coleccionEstudiantes.where('IdEstudiante', isEqualTo: id).get();

  consultaEstudiantes.docs.forEach((documento) {
    estudiante.add(documento.data());
  });
  return estudiante;
}

//permite buscar la información de un Estudiante mediante el id
Future<Map<String, dynamic>> fetchDataById(int Id) async {
  Map<String, dynamic> result = {};

  // Obtener datos de la colección EstudianteCarrera
  QuerySnapshot intermediaSnapshot = await base
      .collection('CarreraEstudiante')
      .where('IdEstudiante', isEqualTo: Id)
      .get();

  if (intermediaSnapshot.docs.isNotEmpty) {
    for (QueryDocumentSnapshot doc in intermediaSnapshot.docs) {
      // Obtener el IdEstudiante y el IdCarrera de EstudianteCarrera
      idCarrera = doc['IdCarrera'];
      idEstudiante = doc['IdEstudiante'];

      // Obtener datos del estudiante
      QuerySnapshot estudianteSnapshot = await base
          .collection('Estudiante')
          .where('IdEstudiante', isEqualTo: idEstudiante)
          .get();

      if (estudianteSnapshot.docs.isNotEmpty) {
        DocumentSnapshot estudianteDocument = estudianteSnapshot.docs.first;
        result['Estudiante'] = estudianteDocument.data();
      }

      // Obtener datos de la carrera
      QuerySnapshot carreraSnapshot = await FirebaseFirestore.instance
          .collection('Carrera')
          .where('IdCarrera', isEqualTo: idCarrera)
          .get();

      if (carreraSnapshot.docs.isNotEmpty) {
        DocumentSnapshot carreraDocument = carreraSnapshot.docs.first;
        result['Carreras'] = carreraDocument.data();
      }

      // Obtener las notas de cada materia del Alumno
      QuerySnapshot notasSnapshot = await base
          .collection('Notas')
          .where('IdEstudiante', isEqualTo: idEstudiante)
          .get();

      if (notasSnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> materiasList = []; // Lista de materias

        for (QueryDocumentSnapshot doc in notasSnapshot.docs) {

          // Obtener el nombre de las materias según su ID
          idMateria = doc['IdMateria'];

          // Obtener las materias
          QuerySnapshot materiaSnapshot = await base
              .collection('Materia')
              .where('IdMateria', isEqualTo: idMateria)
              .get();

          if (materiaSnapshot.docs.isNotEmpty) {
            for (DocumentSnapshot materiasDocument in materiaSnapshot.docs) {
              Map<String, dynamic>? materiaData =
                  materiasDocument.data() as Map<String, dynamic>?;

              if (materiaData != null) {
                Map<String, dynamic> materiaMap = {}; // Mapa de materia
                materiaMap['Materia'] = materiaData;
                materiaMap['Notas'] = doc.data() as Map<String, dynamic>;
                materiasList.add(materiaMap);
              }
            }
          }
        }
        result['Materias'] = materiasList;
      }
    }
  }
  return result;
}

//guardar datos en la tabla Notas 
Future<void> agregarNotas(int Idnotas ,int IdEstudiante, int IdMateria ,double notainicial) async {
  await base.collection('Notas').add({
    "Idnotas": Idnotas,
    "IdEstudiante": IdEstudiante,
    "IdMateria": IdMateria,
    "Evaluacion1": notainicial, 
    "Evaluacion2": notainicial, 
    "Evaluacion3": notainicial, 
    "Evaluacion4": notainicial, 
    "Evaluacion5": notainicial, 
    "NotaFinal": notainicial, 
  });
}

//Modificar los registros de la colección Estudiante
Future<void> modificarEstudiante(int IdEstudiante, String NombreEstudiante, String ApellidoEstudiante, int IdUsuario) async {
  QuerySnapshot estudianteSnapshot = await base.collection('Estudiante').where('IdEstudiante', isEqualTo: IdEstudiante).get();
  if (estudianteSnapshot.docs.isNotEmpty) {
    for (QueryDocumentSnapshot doc in estudianteSnapshot.docs) {
      await doc.reference.update({
        "NombreEstudiante": NombreEstudiante,
        "ApellidoEstudiante": ApellidoEstudiante,
        "IdUsuario": IdUsuario,
      });
    }
  }
}

//Modificar los registros de la colección Notas
Future<void> modificarNotas(int notasId,int IdEstudiante,int IdMateria, double evaluacion1, double evaluacion2, double evaluacion3, double evaluacion4, double evaluacion5, double notaFinal) async {
   QuerySnapshot notasSnapshot = await base.collection('Notas').where('notasId', isEqualTo: notasId).get();
   if (notasSnapshot.docs.isNotEmpty) {
    for (QueryDocumentSnapshot doc in notasSnapshot.docs) {
      await doc.reference.update({
        "IdEstudiante": IdEstudiante,
        "IdMateria": IdMateria,
        "Evaluacion1": evaluacion1,
        "Evaluacion2": evaluacion2,
        "Evaluacion3": evaluacion3,
        "Evaluacion4": evaluacion4,
        "Evaluacion5": evaluacion5,
        "NotaFinal": notaFinal,
      });
    }
  }
}

//obtenemos el ID de las materias que seran para cada una de las careras
Future<List<int>> obtenerIdMaterias(int Id) async {
  List<int> valoresNumericos = [];

  QuerySnapshot intermediamateriacarrera = await base
      .collection('MateriaCarrera')
      .where('IdCarrera', isEqualTo: Id)
      .get();

  if (intermediamateriacarrera.docs.isNotEmpty) {
    for (QueryDocumentSnapshot doc in intermediamateriacarrera.docs) {
      int idMateria = int.parse(doc['IdMateria'].toString());
      valoresNumericos.add(idMateria);
    }
  }
  return valoresNumericos;
}

/*
//Obtener las materias de cada carrera Modificar esta en prueba
Future<Map<String, dynamic>> MateriasCarrerasDataById(int Id) async {
  Map<String, dynamic> result = {};

  // Obtener los identificadores de cada materia
  QuerySnapshot intermediamateriacarrera = await base
      .collection('MateriaCarrera')
      .where('IdCarrera', isEqualTo: Id)
      .get();

  if (intermediamateriacarrera.docs.isNotEmpty) {
    List<int> materiasList = []; // Lista de materias

    for (QueryDocumentSnapshot doc in intermediamateriacarrera.docs) {
      // Obtener el IdEstudiante y el IdCarrera de EstudianteCarrera
      int idMateria = int.parse(doc['IdMateria'].toString());

      materiasList.add(idMateria);
    }

    result['IdMaterias'] = materiasList;
  }

  return result;
}*/







/* codigo bueno
Future<Map<String, dynamic>> MateriasCarrerasDataById(int Id) async {
  Map<String, dynamic> result = {};

  int idCarrera, idEstudiante, idMateria;

  // Obtener datos de la colección EstudianteCarrera
  QuerySnapshot intermediaSnapshot = await base
      .collection('CarreraEstudiante')
      .where('IdEstudiante', isEqualTo: Id)
      .get();

  if (intermediaSnapshot.docs.isNotEmpty) {
    for (QueryDocumentSnapshot doc in intermediaSnapshot.docs) {
      // Obtener el IdEstudiante y el IdCarrera de EstudianteCarrera
      idCarrera = doc['IdCarrera'];
      idEstudiante = doc['IdEstudiante'];

      // Obtener datos del estudiante
      QuerySnapshot estudianteSnapshot = await base
          .collection('Estudiante')
          .where('IdEstudiante', isEqualTo: idEstudiante)
          .get();

      if (estudianteSnapshot.docs.isNotEmpty) {
        DocumentSnapshot estudianteDocument = estudianteSnapshot.docs.first;
        result['Estudiante'] = estudianteDocument.data();
      }

      // Obtener datos de la carrera
      QuerySnapshot carreraSnapshot = await FirebaseFirestore.instance
          .collection('Carrera')
          .where('IdCarrera', isEqualTo: idCarrera)
          .get();

      if (carreraSnapshot.docs.isNotEmpty) {
        DocumentSnapshot carreraDocument = carreraSnapshot.docs.first;
        result['Carreras'] = carreraDocument.data();
      }

      // Obtener las materias del Alumno
      QuerySnapshot intermediamateriacarrera = await base
          .collection('MateriaCarrera')
          .where('IdCarrera', isEqualTo: idCarrera)
          .get();

      if (intermediamateriacarrera.docs.isNotEmpty) {
        List<Map<String, dynamic>> materiasList = []; // Lista de materias

        for (QueryDocumentSnapshot doc in intermediamateriacarrera.docs) {
          // Obtener el IdEstudiante y el IdCarrera de EstudianteCarrera
          idMateria = doc['IdMateria'];

          // Obtener las materias
          QuerySnapshot materiaSnapshot = await base
              .collection('Materia')
              .where('IdMateria', isEqualTo: idMateria)
              .get();

          if (materiaSnapshot.docs.isNotEmpty) {
            for (DocumentSnapshot materiasDocument in materiaSnapshot.docs) {
              Map<String, dynamic>? materiaData =
                  materiasDocument.data() as Map<String, dynamic>?;

              if (materiaData != null) {
                materiasList.add(materiaData);
              }
            }
          }
        }
        print(materiasList);
        result['Materias'] = materiasList;
      }
    }
  }
  return result;
}*/

// Creamos una función para obtener la lista de los tipos de usuarios de Firebase(COMBOBOX)
Future<List<Map<String, dynamic>>> getTpUsuario() async {
  // Creamos una lista vacía de mapas
  List<Map<String, dynamic>> lsTpusuario = [];
  CollectionReference collectionReferencetpusuario =
      base.collection('TipoUsuarios');
  // Agregamos await para esperar a que se complete la operación
  QuerySnapshot querytpusuario = await collectionReferencetpusuario.get();
  querytpusuario.docs.forEach((documentos) {
    // Usamos data() para obtener un mapa con los campos del documento
    // Usamos Map.from() y as Map para convertirlo a un mapa de tipo Map<String, dynamic>
    Map<String, dynamic> data = Map.from(documentos.data() as Map);
    // Verificamos si el mapa contiene el campo 'nombre' antes de acceder a él
    if (data.containsKey('TpUsuario')) {
      // Creamos un nuevo mapa con el nombre y el ID del estudiante
      Map<String, dynamic> tpestudiante = {
        'nombre': data['TpUsuario'],
        'id': data['IdTipoUsuario'],
      };
      // Añadimos el mapa del estudiante a la lista
      lsTpusuario.add(tpestudiante);
    }
  });
  // Devolvemos la lista de estudiantes
  return lsTpusuario;
}

// Creamos una función para obtener la lista las carreras de Firebase (COMBOBOX)
Future<List<Map<String, dynamic>>> getcarrera() async {
  // Creamos una lista vacía de mapas
  List<Map<String, dynamic>> lscarreras = [];

  CollectionReference collectionReferencecarrera = base.collection('Carrera');
  // Agregamos await para esperar a que se complete la operación
  QuerySnapshot querytpcarrera = await collectionReferencecarrera.get();
  querytpcarrera.docs.forEach((documentos) {
    // Usamos data() para obtener un mapa con los campos del documento
    // Usamos Map.from() y as Map para convertirlo a un mapa de tipo Map<String, dynamic>
    Map<String, dynamic> data = Map.from(documentos.data() as Map);
    // Verificamos si el mapa contiene el campo 'nombre' antes de acceder a él
    if (data.containsKey('NombreCarrera')) {
      // Creamos un nuevo mapa con el nombre y el ID del estudiante
      Map<String, dynamic> carrera = {
        'nombre': data['NombreCarrera'],
        'id': data['IdCarrera'],
      };
      // Añadimos el mapa del estudiante a la lista
      lscarreras.add(carrera);
    }
  });
  // Devolvemos la lista de estudiantes
  return lscarreras;
}


/*Future<dynamic> obtenerValorCampo() async {
  // Obtener las materias del Alumno
  QuerySnapshot querySnapshot = await base.collection('Usuario').get();

  if (querySnapshot.docs.isNotEmpty) {
    for (QueryDocumentSnapshot document in querySnapshot.docs) {
      Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

      if (data != null) {
        String valorCampo = data['IdUsuario'];
        print('Valor del campo: $valorCampo');
      }
    }
  } else {
    print('La colección está vacía.');
  }
}*/

//extraemos la cantidad de estudiantes para definir el ID del estudiante automaticamente
Future<int> CantidadEstudiantes() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Estudiante').get();

  int cantidadRegistros = querySnapshot.size;
  
  return cantidadRegistros;
}

//extraemos la cantidad de notas para definir el ID automaticamente
Future<int> obtenerCantidadNotas() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Notas').get();

  int cantidadNotas = querySnapshot.size;
 
  return cantidadNotas;
}