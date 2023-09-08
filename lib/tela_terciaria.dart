import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TelaTerciaria extends StatelessWidget {
  const TelaTerciaria({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reserva de itens'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(child: ReservaApp()),
        ),
      ),
    );
  }
}

class Reserva {
  String nomeCliente = '';
  String telefone = '';
  int diasHospedados = 0;
  DateTime? dataEntrada;
  DateTime? dataSaida;
  int quantidadePessoas = 0;
  bool possuiAnimal = false;
  double valorDiaria = 0.0;
}

class ReservaApp extends StatefulWidget {
  @override
  _ReservaAppState createState() => _ReservaAppState();
}

class _ReservaAppState extends State<ReservaApp> {
  final reserva = Reserva();
  final sdf = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Nome do Cliente'),
          onChanged: (text) {
            setState(() {
              reserva.nomeCliente = text;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Telefone'),
          onChanged: (text) {
            setState(() {
              reserva.telefone = text;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Dia que irá buscar'),
          onChanged: (text) {
            setState(() {
              reserva.diasHospedados = int.tryParse(text) ?? 0;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Quantidade de Peças'),
          onChanged: (text) {
            setState(() {
              reserva.quantidadePessoas = int.tryParse(text) ?? 0;
            });
          },
        ),
        Row(
          children: <Widget>[
            Text('Pagamento com Pix?'),
            Checkbox(
              value: reserva.possuiAnimal,
              onChanged: (value) {
                setState(() {
                  reserva.possuiAnimal = value ?? false;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Exibir os dados da reserva
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Reserva de Hotel'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Nome do Cliente: ${reserva.nomeCliente}"),
                        Text("Telefone: ${reserva.telefone}"),
                        Text("Dia que irá buscar': ${reserva.diasHospedados}"),
                        Text("Quantidade de Peças: ${reserva.quantidadePessoas}"),
                        Text("Pagamento com Pix: ${reserva.possuiAnimal ? "Sim" : "Não"}"),
                      ],
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Fechar'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Exibir Ticket'),
        ),
      ],
    );
  }
}

void main() {
  runApp(TelaTerciaria());
}
