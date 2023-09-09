import 'package:flutter/material.dart';
import 'tela_principal.dart';
import 'tela_secundaria.dart';
import 'tela_terciaria.dart';
import 'tela_quaternaria.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      '/secundaria': (context) => TelaSecundaria(),
      '/terciaria': (context) => TelaTerciaria(
        itensSelecionados: [],
        adicionarItemSelecionado: (Map<String, dynamic> item) {
        },
      ),
      '/quaternaria': (context) => TelaQuaternaria(
        itensSelecionados: [],
        quantidadePecasSelecionadas: 0,
        adicionarItemSelecionado: (Map<String, dynamic> item) {
        },
      ),
    },
    home: TelaPrincipal(),
  ));
}
