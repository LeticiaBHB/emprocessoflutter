import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  int postId;
  int id;
  String title;
  String body;

  Post(this.postId, this.id, this.title, this.body);
}

class Sextenaria extends StatefulWidget {
  const Sextenaria({super.key});

  @override
  State<Sextenaria> createState() => _SextenariaState();
}

class _SextenariaState extends State<Sextenaria> {
  String _urlBase = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> _recupPostagens() async {
    Uri url = Uri.parse(_urlBase + '/posts');
    http.Response response = await http.get(url);
    List<dynamic> dadosJson = json.decode(response.body);
    List<Post> postagens = [];
    for (var post in dadosJson) {
      print('post:' + post['title']);
      Post p = Post(post['userId'], post['id'], post['title'], post['body']);
      postagens.add(p);
    }
    return postagens;
  }

  _post() {}
  _put() {}
  _patch() {}
  _delete() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de Serviço Avançado'),
      ),
      body: Container(
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
                  onPressed: _put,
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
    );
  }
}
