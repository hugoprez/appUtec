import 'package:flutter/material.dart';
import 'package:apputec/paginas/principal.dart';
import 'package:firebase_core/firebase_core.dart';
// Import the generated file
import 'firebase_options.dart';
import 'package:apputec/paginas/pantallas/addestudiante.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
    // home: MyHomePage(),
     initialRoute: '/',
      routes: {
        '/':(context) => const MyHomePage(),
        '/add':(context) => const addestudiante(),
        //'/edit':(context) => const Modificar_user()
      },
    );
  }
}