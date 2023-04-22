import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ConsultarMaterias extends StatefulWidget {
  const ConsultarMaterias({super.key});

  @override
  State<ConsultarMaterias> createState() => _ConsultarMateriasState();
}

class _ConsultarMateriasState extends State<ConsultarMaterias> {
  int MenuActivo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5D0A28),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Column(
      children: [
        /*Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(Icons.arrow_back,
                    color: Colors.black.withOpacity(0.5), size: 50),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Container(
                  //padding: EdgeInsets.only(top: 5),
                  height: 50,
                  child: Column(
                    children: [
                      Container(
                        child: Text("Maria Torrez",
                            style: TextStyle(fontSize: 25)),
                      ),
                      Container(
                        child: Text("Ingeniero en sistema",
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  )),
              Container(
                child: Icon(Icons.more_horiz,
                    color: Colors.black.withOpacity(0.5), size: 50),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          ),
          height: 75,
          decoration: BoxDecoration(color: Colors.white),
        ),*/
        Expanded(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Bienvenido!",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              Container(
                child: Column(children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 360,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFF9D5871),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 50,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Estudiantes",
                                    style: TextStyle(fontSize: 17),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text(
                                    "Ciclo #1",
                                    style: TextStyle(fontSize: 17),
                                  ))
                            ],
                          ),
                          width: 300,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 150),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.red,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  )
                ]),
                decoration: BoxDecoration(color: Colors.white),
              )
            ],
          ),
        )
      ],
    );

    /*return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "Buscar Estudiantes",
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.deepPurpleAccent,
                  decoration: InputDecoration(
                      prefixIcon: Icon(LineIcons.search,
                          color: Colors.white.withOpacity(0.03)),
                      border: InputBorder.none,
                      hintText: "Busqueda",
                      hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.3), fontSize: 17)),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      MenuActivo == 0 ? getLlamadas() : getLlamadasPerdidas()
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );*/
  }

  Widget getLlamadas() {
    return Column(
      children: [
        Container(
          child: Text("Hugo Alberto Antillón Pérez"),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          width: 200,
          height: 150,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getLlamadasPerdidas() {
    return Container();
  }
}
