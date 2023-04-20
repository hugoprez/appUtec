import 'package:flutter/material.dart';

class ConsultarMaterias extends StatelessWidget {
  const ConsultarMaterias({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 15),
                        child: Image.network(
                            "https://static.wikia.nocookie.net/logopedia/images/8/85/UTEC_El_Salvador_Seal.png"),
                        width: 370,
                        height: 100,
                        //decoration: BoxDecoration(color: Colors.amber),
                      ),
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
                        height: 275,
                        decoration: BoxDecoration(
                          color: Color(0xFF5D0A28),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        top: 100,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "Materias Actuales",
                                    style: TextStyle(fontSize: 17),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    "Ciclo #1",
                                    style: TextStyle(fontSize: 17),
                                  ))
                            ],
                          ),
                          width: 300,
                          height: 150,
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
  }
}

/**
 * 
 * 
 * Container(
                  child: Text("Hugo Alberto Antillón Pérez"),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: 330,
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
 */