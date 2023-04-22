import 'package:flutter/material.dart';
import 'package:apputec/paginas/figura/tarjeta.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List _post = [
      'Pantalla #1',
      'Pantalla #2',
      'Pantalla #3',
      'Pantalla #3',
      'Pantalla #3'
    ];
    return Column(
      children: [
        Container(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                                child: const Text("Hugo Alberto Antillón Pérez",
                                    style: TextStyle(color: Colors.white))),
                          Container(
                              padding: EdgeInsets.all(15.0),
                              child: const Text("25-5030-2018",
                                  style: TextStyle(color: Colors.white))),
                        ],
                      ),
                    ],
                  ),
                  height: 230,
                  //decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
                ),
              ],
            ),
            height: 350,
            decoration: BoxDecoration(
              color: Color(0xFF5D0A28),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _post.length,
              itemBuilder: (context, index) {
                return Tarjeta(child: _post[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
