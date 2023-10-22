import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:samsung_camp/data/model/wordModel.dart';

class Samsung2 extends StatefulWidget {
  const Samsung2({super.key});

  @override
  State<Samsung2> createState() => _Samsung2State();
}

class _Samsung2State extends State<Samsung2> {
  late Future<Word> futureWord;
  @override
  void initState() {
    super.initState();
    futureWord = fetchWord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FutureBuilder<Word>(
            future: futureWord,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // ! it does NOT execute
                print(snapshot.data!.word.runtimeType);
                return Text(snapshot.data!.word.toString());
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

Future<Word> fetchWord() async {
  // ? Get form API
  final response = await http.get(
      Uri.parse('https://samsung.alsaeed.dev/second/dot_product/{Milk}/${5}'));

  if (response.statusCode == 200) {
    return Word.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Word');
  }
}
