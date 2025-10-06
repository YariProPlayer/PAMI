import 'package:geolocator/geolocator.dart';

Future<Position> getLocalizacao() async{
  bool servicoHabilitado = await Geolocator.isLocationServiceEnabled();
  if(!servicoHabilitado){
    return Future.error("Serviço de localizaçao desativado");

  }

  LocationPermission permissao = await Geolocator.checkPermission();
  if (permissao == LocationPermission.denied){
    permissao = await Geolocator.requestPermission();
    if (permissao == LocationPermission.denied){
      return Future.error("Permissão Negada");
    }
  }

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}