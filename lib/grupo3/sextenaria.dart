import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post(this.userId, this.id, this.title, this.body);
}

class Sextenaria extends StatefulWidget {
  const Sextenaria({Key? key}) : super(key: key);

  @override
  _SextenariaState createState() => _SextenariaState();
}

class _SextenariaState extends State<Sextenaria> {
  String _urlBase = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> _recupPostagens() async {
    Uri url = Uri.parse(_urlBase + '/posts');
    http.Response response = await http.get(url);
    List<dynamic> dadosJson = json.decode(response.body);
    List<Post> postagens = [];
    for (var post in dadosJson) {
      print('post: ' + post['title']);
      Post p = Post(post['userId'], post['id'], post['title'], post['body']);
      postagens.add(p);
    }
    return postagens;
  }

  _post() async { //posta
    var corpo = json.encode({
      'userId': 120,
      'id': null,
      'title': 'titulo',
      'body': 'corpo da postagem',
    });
    http.Response response = await http.post(
      Uri.parse(_urlBase + "/posts"),
      headers: {
        'content-type': 'application/json; charset=UTF-8'
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print('resposta: ${response.body}');
  }

  _put() async { //atualiza
    var corpo = json.encode({
      'userId': 120,
      'id': null,
      'title': 'titulo alterado',
      'body': 'corpo da postagem alterado',
    });
    http.Response response = await http.put(
      Uri.parse(_urlBase + "/posts/2"),
      headers: {
        'content-type': 'application/json; charset=UTF-8'
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print('resposta: ${response.body}');
  }

  _patch() async { // atualiza parcialmente um recurso
    var corpo = json.encode({
      'userId': 120,
      'body': 'corpo da postagem alterado',
    });
    http.Response response = await http.put(
      Uri.parse(_urlBase + "/posts/2"),
      headers: {
        'content-type': 'application/json; charset=UTF-8'
      },
      body: corpo,
    );
    print("resposta: ${response.statusCode}");
    print('resposta: ${response.body}');
  }

  _delete() async {
    Uri url = Uri.parse(_urlBase + '/posts/2'); // Crie um objeto Uri com a URL
    http.Response response = await http.delete(url);
    print("resposta: ${response.statusCode}");
    print('resposta: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área de postagens'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fundo2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.white.withOpacity(0.5),
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _post,
                      child: Text('Salvar'),
                    ),
                    ElevatedButton(
                      onPressed: _put, //put ou patch
                      child: Text('Atualizar'),
                    ),
                    ElevatedButton(
                      onPressed: _delete,
                      child: Text('Deletar'),
                    ),
                  ],
                ),
                Expanded(
                  child: FutureBuilder<List<Post>>(
                    future: _recupPostagens(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        case ConnectionState.active:
                        case ConnectionState.done:
                          if (snapshot.hasError || snapshot.data == null) {
                            print('Erro ao carregar lista');
                            return Center(
                              child: Text('Erro ao carregar lista'),
                            );
                          } else {
                            print('Lista carregada com sucesso');
                            return ListView.builder(
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                List<Post> lista = snapshot.data!;
                                Post post = lista[index];
                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.id.toString()),
                                );
                              },
                            );
                          }
                          break;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
