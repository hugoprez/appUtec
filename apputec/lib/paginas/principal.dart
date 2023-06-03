import 'package:flutter/material.dart';
import 'package:apputec/paginas/menu/recuperarcontrasena.dart';
import 'package:apputec/paginas/menu/consultamaterias.dart';
import 'package:apputec/paginas/menu/home.dart';
import 'package:apputec/paginas/menu/login.dart';
import 'package:apputec/paginas/pantallas/estudiantes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    int ItemSeleccionadoIndex=0;

  void _NavigationBotonBar(int index){
      setState(() {
        ItemSeleccionadoIndex=index;

      });
  }

 final List<Widget> _Paginas = [
    Login(),
    Home(),
    ConsultarMaterias(),
    /*RecuperarContrasena(),
    MostrarEstudiantes()*/
  ];

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body:_Paginas[ItemSeleccionadoIndex],
      
      
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ItemSeleccionadoIndex ,
            type: BottomNavigationBarType.fixed,
            onTap: _NavigationBotonBar,
             items:[
              BottomNavigationBarItem(icon: Icon(Icons.local_pizza),label: "Login"),
              BottomNavigationBarItem(icon: Icon(Icons.home ),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person_2),label: "Estudiantes"),
              /*BottomNavigationBarItem(icon: Icon(Icons.local_pizza),label: "Recuperar contra"),
              BottomNavigationBarItem(icon: Icon(Icons.person_2),label: "Estudiantes")*/
            ],
        ),


    );
  }
}