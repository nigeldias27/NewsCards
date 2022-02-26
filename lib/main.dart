import 'package:flutter/material.dart';
import 'news_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'end_of_feed.dart';

void main() {
  runApp(const MyApp());
}

int i = 0;
// ignore: non_constant_identifier_names
List list_of_articles = [];
reading() async {
  // ignore: avoid_print
  var stringOfArticles = await http.read(Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=53c96180e8e44401a15afbb6dfaec23a'));
  Map mapOfArticles = json.decode(stringOfArticles);
  list_of_articles = mapOfArticles['articles'];
  return {
    'title': list_of_articles[i]['title'],
    'url': list_of_articles[i]['url'],
    'image': list_of_articles[i]['urlToImage'],
    'description': list_of_articles[i]['description']
  };
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: reading(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              home: news_item(
                json: list_of_articles,
                index: i,
              ),
            );
          } else {
            return MaterialApp(
                home: Scaffold(
                    body: Center(
                        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Loading Feed...',
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                )
              ],
            ))));
          }
        });
  }
}
