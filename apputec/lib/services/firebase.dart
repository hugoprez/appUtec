import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore base = FirebaseFirestore.instance;

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
Future<void> agregarUsuario(String usuario) async {
  await base.collection('Usuario').add({"nombre": usuario});
}

//obtener los estudiantes
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

//agregar estudiante
Future<void> agregarEstudiante(Int codigo, String estudiante,String apellido,Int tpUsuario) async {
  await base.collection('Estudiante').add({"IdEstudiante": codigo,"NombreEstudiante": estudiante,"ApellidoEstudiante": apellido,"IdUsuario": tpUsuario});
}


//Prueba

Future<List> obtenerInformacionRelacionada() async {
  List IDstudents = [];

  CollectionReference CollectionReferenceEstudianteId =
      base.collection('Estudiante');
  QuerySnapshot queryestudianteID = await CollectionReferenceEstudianteId.get();
  queryestudianteID.docs.forEach((documentos) {
    IDstudents.add(documentos.data());
  });

  return IDstudents;
}
