import 'package:flutter/material.dart';

class RecuperarContrasena extends StatelessWidget {
  const RecuperarContrasena({super.key});

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
                          "Recuper contraseña",
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
                             /* child: const Text("Hugo Alberto Antillón Pérez",
                                  style: TextStyle(color: Colors.white))*/),
                          Container(
                            /*  padding: EdgeInsets.all(15.0),
                              child: const Text("25-5030-2018",
                                  style: TextStyle(color: Colors.white))*/),
                        ],
                      ),
                    ],
                  ),
                  height: 230,
                  //decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
                ),
              ],
            ),
            height: 230,
            decoration: BoxDecoration(
              color: Color(0xFF5D0A28),
             /* borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),*/
            ),
          ),
        ),
        /*SizedBox(
          height: 25,
        ),*/
        Container(
          child: Column(
            children: [
                SizedBox(
                 height: 50,),
              Text("Ingrese su correo electronico:",
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),  
              SizedBox(
                 height: 35,),        
               _correo(),
               SizedBox(
                 height: 25,),
               ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                  primary:  Color(0xFF5D0A28),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                    ),
                    child: Text('Enviar',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      ),),),
                      SizedBox(
                       height: 5,),
                       ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                        primary:  Color(0xFF5D0A28),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text('Atras',
                      style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      ),),)
            ], 
          ),
          height: 400,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 253, 255),
              borderRadius: BorderRadius.circular(30),
                /*bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),*/
            ),            
        ),
        

        
        Container(
          height: 90,
            decoration: BoxDecoration(
              color: Color(0xFF5D0A28),
             /* borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),*/
            ),
        )
       /* Padding(
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
        ),*/
      ],
    );
  }
}
Container _correo(){
    return Container(
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black)),
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              icon: Icon(Icons.contact_emergency, color: Colors.grey),
              hintText: 'Correo de Recuperacion',
              labelText: 'Correo de Recuperacion',
              border: InputBorder.none),
        )
    );
}



