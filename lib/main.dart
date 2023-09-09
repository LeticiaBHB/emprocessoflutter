import 'package:flutter/material.dart';
import 'package:listas_e_outros/grupo2/tela_quintenaria.dart';
import 'package:listas_e_outros/grupo3/sextenaria.dart';
import 'tela_principal.dart';
import 'grupo1/tela_secundaria.dart';
import 'grupo1/tela_terciaria.dart';
import 'grupo1/tela_quaternaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      '/secundaria': (context) => TelaSecundaria(),
      '/terciaria': (context) => TelaTerciaria(
        itensSelecionados: [],
        adicionarItemSelecionado: (Map<String, dynamic> item) {},
      ),
      '/quaternaria': (context) => TelaQuaternaria(quantidadePecasSelecionadas: 0,),
      '/quintenario': (context) => TelaQuintenaria(),
      '/sextenaria': (context) => Sextenaria(),
    },
    home: TelaPrincipal(),
  ));
}
