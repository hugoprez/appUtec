import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore base = FirebaseFirestore.instance;

Future<List> getUsuarios() async{
  List users=[];

  CollectionReference CollectionReferenceUsuarios=base.collection('Usuario');
  QuerySnapshot queryusuarios= await CollectionReferenceUsuarios.get();
  queryusuarios.docs.forEach((documentos) {
    users.add(documentos.data());
   });
  return users;
}

//guardar usuario
Future<void> agregarUsuario(String usuario) async {
  await base.collection('Usuario').add({"nombre": usuario});
}
