import 'package:flutter/material.dart';
import 'package:listas_e_outros/tela_principal.dart';
import 'package:listas_e_outros/tela_secundaria.dart';
import 'package:listas_e_outros/tela_terciaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:"/",routes: {
      '/secundaria':(context) => TelaSecundaria(),
      '/terciaria':(context) => TelaTerciaria(),
      '/terciaria':(context) => TelaTerciaria(),
  },
    home:TelaPrincipal (),
  ));
}