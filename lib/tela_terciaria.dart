import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TelaTerciaria extends StatelessWidget {
  const TelaTerciaria({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reserva de Hotel'),
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
          decoration: InputDecoration(labelText: 'Dias Hospedados'),
          onChanged: (text) {
            setState(() {
              reserva.diasHospedados = int.tryParse(text) ?? 0;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Data de Entrada (dd/mm/yyyy)'),
          onChanged: (text) {
            setState(() {
              reserva.dataEntrada = DateTime.tryParse(text);
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Data de Saída (dd/mm/yyyy)'),
          onChanged: (text) {
            setState(() {
              reserva.dataSaida = DateTime.tryParse(text);
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Quantidade de Pessoas'),
          onChanged: (text) {
            setState(() {
              reserva.quantidadePessoas = int.tryParse(text) ?? 0;
            });
          },
        ),
        Row(
          children: <Widget>[
            Text('Possui Animal?'),
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
        TextField(
          decoration: InputDecoration(labelText: 'Valor da Diária'),
          onChanged: (text) {
            setState(() {
              reserva.valorDiaria = double.tryParse(text) ?? 0.0;
            });
          },
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
                        Text("Dias Hospedados: ${reserva.diasHospedados}"),
                        Text("Data de Entrada: ${reserva.dataEntrada != null ? sdf.format(reserva.dataEntrada!) : ''}"),
                        Text("Data de Saída: ${reserva.dataSaida != null ? sdf.format(reserva.dataSaida!) : ''}"),
                        Text("Quantidade de Pessoas: ${reserva.quantidadePessoas}"),
                        Text("Possui Animal: ${reserva.possuiAnimal ? "Sim" : "Não"}"),
                        Text("Valor da Diária: R\$ ${reserva.valorDiaria.toStringAsFixed(2)}"),
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
          child: Text('Exibir Reserva'),
        ),
      ],
    );
  }
}

void main() {
  runApp(TelaTerciaria());
}
