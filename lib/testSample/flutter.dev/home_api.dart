import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samsung_camp/testSample/flutter.dev/PostModel.dart';

class HomeApi extends StatefulWidget {
  const HomeApi({super.key});

  @override
  State<HomeApi> createState() => _HomeApiState();
}

class _HomeApiState extends State<HomeApi> {
  // Get Api Request
  Future<List<Post>> fetchPost() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(uri);
    final posts = <Post>[];

    if (response.statusCode == 200) {
      final list = json.decode(response.body);
      for (final item in list) {
        posts.add(Post.fromJson(item));
      }
      return posts;
    } else {
      throw Exception('Failed to load post');
    }
  }

  // POST Api Request
  Future<Post> creatPost(String title, String body) async {
    Map<String, dynamic> request = {
      'title': title,
      'body': body,
      'userId': "111"
    };
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    final response = await http.post(uri, body: request);
    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('NO Post data to the server ');
    }
  }

// ? Wael
//   Future getPost() async {
//     var url = "https://jsonplaceholder.typicode.com/posts";
//     var response = await http.get(url as Uri);
//     var responseBody = response.body;
//     print(responseBody[0]);

// initState(){
//   getPost();
//   super.initState();
// }
//   }
// ?
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: 500,
            width: 600,
            color: Colors.blue[200],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder<List<Post>?>(
                    future: fetchPost(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return Container();
                      } else {
                        return buildDataWidget(context, snapshot);
                      }
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

Widget buildDataWidget(context, snapshot) => ListView(
      shrinkWrap: true,
      children: [
        for (final post in snapshot.data) ...[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(post.title),
          ),
        ],
      ],
    );
