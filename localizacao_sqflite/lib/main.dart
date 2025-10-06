import 'package:flutter/material.dart';
import 'package:localizacao_sqflite/screen/tela_principal.dart';
 
void main() {
  runApp(const MainApp());
}
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Localização com SQLFlite',
      theme: ThemeData(primaryColor: Colors.amber),
      home: HomePage(),
    );
  }
}
