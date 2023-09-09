import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Reserva {
  String nomeCliente = '';
  String telefone = '';
  int diasreservados = 0;
  bool pix = false;
}

class TelaQuaternaria extends StatefulWidget {
  final int quantidadePecasSelecionadas;

  TelaQuaternaria({
    Key? key,
    required this.quantidadePecasSelecionadas,
  });
  @override
  State<TelaQuaternaria> createState() => _TelaQuaternariaState();
}

class _TelaQuaternariaState extends State<TelaQuaternaria> {
  final reserva = Reserva();
  final sdf = DateFormat("dd/MM/yyyy");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/fundo1.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.5),
              margin: EdgeInsets.fromLTRB(50, 50, 30, 10),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Quantidade de Peças Selecionadas: ${widget.quantidadePecasSelecionadas}'),
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
                        reserva.diasreservados = int.tryParse(text) ?? 0;
                      });
                    },
                  ),
                  Row(
                    children: <Widget>[
                      Text('Pagamento com Pix?'),
                      Checkbox(
                        value: reserva.pix,
                        onChanged: (value) {
                          setState(() {
                            reserva.pix = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Center(

                    child: ElevatedButton(
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
                                    Text("Dia que irá buscar': ${reserva.diasreservados}"),
                                    Text("Quantidade de Peças: ${widget.quantidadePecasSelecionadas}"),
                                    Text("Pagamento com Pix: ${reserva.pix ? "Sim" : "Não"}"),
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
                      child: Text('Exibir Ticket', textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
