import 'package:flutter/material.dart';
class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                  child: Text('tela principal'),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/secundaria');
                },
                child: Text('Ir para a segunda tela'
                ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/terciaria');
              },
              child: Text('Ir para a terceira tela'),
            ),
          ],
        ),
      ),
    );
  }
}
