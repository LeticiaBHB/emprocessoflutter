import 'package:flutter/material.dart';
import 'package:listas_e_outros/tela_principal.dart';
import 'package:listas_e_outros/tela_secundaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute:"/",routes: {
      '/secundaria':(context) => TelaSecundaria(),
  },
    home:TelaPrincipal (),
  ));
}