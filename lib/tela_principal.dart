import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final List<String> words = ['LOJA', 'DO', 'FUTURO'];
  int currentWordIndex = 0;
  double animationValue = 0.0;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    while (currentWordIndex < words.length) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        currentWordIndex++;
      });
      await Future.delayed(Duration(milliseconds: 500));
    }
    // Quando todas as palavras aparecerem, comece a animação de cores.
    for (double i = 0.0; i <= 1.0; i += 0.01) {
      await Future.delayed(Duration(milliseconds: 20));
      setState(() {
        animationValue = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            Column(
              children: [
                Center(
                  child: AnimatedBuilder(
                    animation: ModalRoute.of(context)!.animation!,
                    builder: (context, child) {
                      final color = HSLColor.fromAHSL(
                        1.0,
                        animationValue * 360.0,
                        1.0,
                        0.5,
                      ).toColor();

                      return Container(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          words.sublist(0, currentWordIndex).join(' '),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 100),
                Expanded(
                  child: Column( //botões
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/secundaria');
                        },
                        child: Text('Ir para a compras'),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/terciaria');
                        },
                        child: Text('Ir para carrinho de compras'),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/quintenario');
                        },
                        child: Text('Área de comentarios'),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/sextenaria');
                        },
                        child: Text('Área de postagens'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
