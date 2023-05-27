/*import 'package:flutter/material.dart';
import 'package:apputec/paginas/figura/tarjeta.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                          "LOGIN",
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
              _imagen(),
          
               _nombreimput(),
                SizedBox(
                 height: 25,),
               _passwordinput(),
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
                    child: Text('Ingresar',
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
Container _nombreimput(){
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
              hintText: 'Ingrese su usuario',
              labelText: 'Usuario',
              border: InputBorder.none),
        )
    );
}
Container _passwordinput() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        padding: EdgeInsets.symmetric(horizontal: 25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: TextFormField(
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
              icon: Icon(Icons.password, color: Colors.grey),
              hintText: 'Ingrese su Contraseña',
              labelText: 'Contraseña',
              border: InputBorder.none),
          obscureText: true,
        )); //caja de texto
  }
  Container _imagen() {
    return Container(
      width: 150,
      height: 150,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Image.network("https://png.pngtree.com/png-vector/20191110/ourlarge/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg",fit: BoxFit.contain,));
  }
 */

import 'package:flutter/material.dart';
import 'package:apputec/widgets/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:apputec/services/firebase.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController IdController = TextEditingController();
  TextEditingController CorreouserController = TextEditingController(text: "");
  TextEditingController PassworduserController = TextEditingController(text: "");
  TextEditingController tpUsuarioController = TextEditingController(text: "");

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final List _post = [
      'Pantalla #1',
      'Pantalla #2',
      'Pantalla #3',
      'Pantalla #3',
      'Pantalla #3'
    ];
    String usuarios;
    String password;
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Portal Educativo",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Iniciar session para comenzar",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Image.network(
                      "https://static.wikia.nocookie.net/logopedia/images/8/85/UTEC_El_Salvador_Seal.png",
                        width: 370,
                        height: 200,),
                    
                      
                  TextFormField(
                    controller: IdController,
                     keyboardType: TextInputType.number,
                       decoration: textInputDecoration.copyWith(
                        labelText: "Correo",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        )),
                    onChanged: (val) {
                      setState(() {
                        CorreouserController.text = val;
                      });
                    },
                    validator: (value) {
                      return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!)
                          ? null
                          : "Favor Ingresar correo valido";
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  
                  TextFormField(
                    obscureText: true,
                    decoration: textInputDecoration.copyWith(
                        labelText: "Contraseña",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                        )),
                    validator: (val) {
                      if (val!.length < 0) {
                        return "El password debe ser mayor de 0 caracteres";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (val) {
                      setState(() {
                        PassworduserController.text = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          "Ingresar",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      )),
                ]),
          ),
        ),
      ),
    );
  }

  login() {}
}
