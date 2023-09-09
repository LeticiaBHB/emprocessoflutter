import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment(this.postId, this.id, this.name, this.email, this.body);
}

class TelaQuintenaria extends StatefulWidget {
  @override
  State<TelaQuintenaria> createState() => _TelaQuintenariaState();
}

class _TelaQuintenariaState extends State<TelaQuintenaria> {
  String _baseUrl = 'http://jsonplaceholder.typicode.com/comments';

  Future<List<Comment>> recupararComentarios() async {
    http.Response response = await http.get(Uri.parse(_baseUrl));
    List<dynamic> dadosJson = json.decode(response.body);
    List<Comment> comentarios = [];
    for (var comentario in dadosJson) {
      print('Comentário: ' + comentario['name']);
      Comment c = Comment(
        comentario['postId'],
        comentario['id'],
        comentario['name'],
        comentario['email'],
        comentario['body'],
      );
      comentarios.add(c);
    }
    return comentarios;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área de Comentários'),
      ),
      body: FutureBuilder<List<Comment>>(
        future: recupararComentarios(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              print('Conexão concluída');
              if (snapshot.hasError) {
                print('Erro ao carregar lista');
                return Center(
                  child: Text('Erro ao carregar lista'),
                );
              } else {
                print('Lista carregada com sucesso');
                List<Comment>? comentarios = snapshot.data;
                return ListView.builder(
                  itemCount: comentarios?.length ?? 0,
                  itemBuilder: (context, index) {
                    Comment comentario = comentarios![index];
                    return ListTile(
                      title: Text(comentario.name),
                      subtitle: Text(comentario.email),
                    );
                  },
                );
              }
          }
          return Center(
            child: Text('Resultado'),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TelaQuintenaria(),
  ));
}
