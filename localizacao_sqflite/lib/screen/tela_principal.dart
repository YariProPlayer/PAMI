import 'package:flutter/material.dart';
import 'package:localizacao_sqflite/database/db.dart';
import 'package:localizacao_sqflite/localizacao/geo.dart';
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> _localizacoes = [];
 
  void getSalvarLocalizacao() async{
    final pos = await getLocalizacao();
 
    await DatabaseHelper.initDB();
 
  }
 
  void _carregarLocalizacao() async {
    final dados = await DatabaseHelper.getLocalizacao();
    setState(() {
      _localizacoes = dados;
    });
  }
 
  @override
  void initDB(){
    super.initState();
    _carregarLocalizacao();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de Localização"),
      ),
      body: ListView.builder(
        itemCount: _localizacoes.length,
        itemBuilder: (context, index) {
          final loc = _localizacoes[index];
          return ListTile(
            title: Text("Lat: ${loc['latitude']}, Long: ${loc['longitude']}"),
            subtitle: Text(loc['xarimboData']),
          );        
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getSalvarLocalizacao,
        child: Icon(Icons.my_location),
      ),
    );
  }
}
 