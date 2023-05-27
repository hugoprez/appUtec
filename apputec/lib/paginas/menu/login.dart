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
