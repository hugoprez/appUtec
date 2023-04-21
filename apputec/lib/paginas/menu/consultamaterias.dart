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
      backgroundColor: Colors.redAccent,
      //appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      backgroundColor: Colors.green,
      centerTitle: true,
      leading: IconButton(
        icon: Text(
          "Editar",
          style: TextStyle(
              fontSize: 14, color: Colors.limeAccent[100], fontWeight: FontWeight.w500),
        ),
        onPressed: null,
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.call,
           color: Colors.deepPurple[100],
          ),
          onPressed: null,
        )
      ],
      title: Container(
          width: 155,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.red.withOpacity(0.05)),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      MenuActivo = 0;
                    });
                  },
                  child: Container(
                    width: 75,
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MenuActivo == 0
                            ? Colors.white.withOpacity(0.3)
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        "Editar",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      MenuActivo = 1;
                    });
                  },
                  child: Container(
                    width: 75,
                    height: 28,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MenuActivo == 1
                            ? Colors.white.withOpacity(0.3)
                            : Colors.transparent),
                    child: Center(
                      child: Text(
                        "Perdidas",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget getBody() {
    return ListView(
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
                    fontSize: 23, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.deepPurpleAccent,
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(LineIcons.search, color: Colors.white.withOpacity(0.3)),
                      border: InputBorder.none,
                      hintText: "Busqueda",
                      hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.3), fontSize: 17)),
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
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.1)),
                        child: Container(
                          child: Center(
                            child: Icon(
                              LineIcons.video,
                              color: Colors.lime[150],
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Video llamada",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, right: 5, left: 5),
                        child: Divider(color: Colors.white.withOpacity(0.3)),
                      ),
                      MenuActivo == 0 ? getLlamadas() : getLlamadasPerdidas()
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

   Widget getLlamadas() {
    return Row(
                  
            children: [
                    Container(
                      // width: (tamanio.width - 30) * 0.4,
                      child: Row(children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // width: (tamanio.width - 100) * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                              "DDDDD",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Llamada entrante",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.5),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      width: 150,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                             "eeeeeeeeeee",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                 color: Colors.white.withOpacity(0.5)),
                            ),
                            Icon(
                              Icons.info_outline,
                             color: Colors.pinkAccent,
                            )
                          ]),
                    ),
                  ],
    );
   }
/*
  Widget getLlamadas() {
    var tamanio = MediaQuery.of(context).size;
    return Column(
      children: List.generate(chat_data.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: FadeInDown(
            duration: Duration(milliseconds: 100 * index),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      // width: (tamanio.width - 30) * 0.4,
                      child: Row(children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage('https://slp-statics.astockcdn.net/static_assets/staging/23winter/home/EMEA/curated-collections/card-1.jpg?width=580&format=webp'),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          // width: (tamanio.width - 100) * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat_data[index]['name'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: white,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: white.withOpacity(0.5),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Llamada entrante",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: white.withOpacity(0.5),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                    ),
                    Container(
                      width: 150,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              chat_data[index]['date'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: white.withOpacity(0.5)),
                            ),
                            Icon(
                              Icons.info_outline,
                              color: primario,
                            )
                          ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Divider(
                    color: white.withOpacity(0.3),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }*/

  Widget getLlamadasPerdidas() {
    return Container();
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