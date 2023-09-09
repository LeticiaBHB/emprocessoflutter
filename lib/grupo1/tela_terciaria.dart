import 'package:flutter/material.dart';
import 'package:listas_e_outros/grupo1/tela_quaternaria.dart';

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
                  children: widget.itensSelecionados.map((item) {
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TelaQuaternaria(
                          quantidadePecasSelecionadas: widget.itensSelecionados.length,
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