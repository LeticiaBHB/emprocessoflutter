import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:listas_e_outros/grupo1/tela_terciaria.dart';

class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  List _itens = [];
  List itensSelecionados = [];


  String limitarTexto(String texto, int limitePalavras) {
    List<String> palavras = texto.split(' ');
    if (palavras.length <= limitePalavras) {
      return texto;
    }
    String textoLimitado = '';
    for (int i = 0; i < limitePalavras; i++) {
      textoLimitado += palavras[i] + ' ';
    }
    return textoLimitado.trim() + '...';
  }

  Future<void> _carregarItens() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products?limit=20'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _itens = data;
      });
    } else {
      throw Exception('Falha ao carregar dados da API');
    }
  }

  @override
  void initState() {
    super.initState();
    _carregarItens();
  }

  Future<void> _exibirAlertaComImagem(String imageUrl) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fechar o AlertDialog
                  },
                  child: Text('Voltar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _adicionarItemSelecionado(Map item) async {
    setState(() {
      itensSelecionados.add(item);
    });
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TelaTerciaria(itensSelecionados: [], adicionarItemSelecionado: (Map<String, dynamic> item) {
        },),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: _itens.length,
          itemBuilder: (context, indice) {
            String descricaoLimitada =
            limitarTexto(_itens[indice]['description'], 10);
            return ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(_itens[indice]['title']),
                      titlePadding: EdgeInsets.all(20),
                      titleTextStyle: TextStyle(fontSize: 20, color: Colors.black87),
                      content: Text(_itens[indice]['description']),
                      contentPadding: EdgeInsets.all(25),
                      backgroundColor: Colors.blue[200],
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Voltar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _adicionarItemSelecionado(_itens[indice]);
                          },
                          child: Text('Adicionar'),
                        ),
                      ],
                    );
                  },
                );
              },
              title: Text(_itens[indice]['title']),
              subtitle: Text(
                descricaoLimitada,
                style: TextStyle(fontSize: 14.0),
              ),
              leading: GestureDetector(
                onTap: () {
                  _exibirAlertaComImagem(_itens[indice]['image']);
                },
                child: Image.network(
                  _itens[indice]['image'],
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}