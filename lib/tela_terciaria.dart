import 'package:flutter/material.dart';
import 'tela_quaternaria.dart';

class TelaTerciaria extends StatefulWidget {
  final List itensSelecionados;
  final Function(Map<String, dynamic>) adicionarItemSelecionado;
  TelaTerciaria({
    Key? key,
    required this.itensSelecionados,
    required this.adicionarItemSelecionado,
  });
  @override
  _TelaTerciariaState createState() => _TelaTerciariaState();
}

class _TelaTerciariaState extends State<TelaTerciaria> {
  List<Map<String, dynamic>> itensSelecionados = [];
  void adicionarItemSelecionado(Map<String, dynamic> item) {
    setState(() {
      itensSelecionados.add(item);
    });
  }
  void removerItemSelecionado(Map<String, dynamic> item) {
    setState(() {
      itensSelecionados.remove(item);
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reserva de itens'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Itens selecionados:', style: TextStyle(fontSize: 20)),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: itensSelecionados.map((item) {
                    return ListTile(
                      title: Text(item['title']),
                      subtitle: Text(item['description']),
                      leading: Image.network(
                        item['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navegue para a TelaQuaternaria e passe os itens selecionados
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TelaQuaternaria(
                          itensSelecionados: itensSelecionados,
                          quantidadePecasSelecionadas: itensSelecionados.length, adicionarItemSelecionado: (Map<String, dynamic> item) {  }, // Atualize aqui
                        ),
                      ),
                    );
                  },
                  child: Text('Confirmar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
