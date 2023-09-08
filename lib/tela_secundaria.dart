import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria>{
  List _list = [];
  void _carregarItens(){

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Center(
                  child: Container(
                    child: Text('tela secundária'),
                  ),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Ir para a primeira tela'),
                ),
              ],
            ),

            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, indice){
                  print('item${indice}');
                  return ListTile(
                    title:  Text(indice.toString()),
                    subtitle: Text('subtitulo'),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
