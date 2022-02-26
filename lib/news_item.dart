import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';
import 'end_of_feed.dart';

// ignore: camel_case_types
class news_item extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final index, json;
  const news_item({Key? key, this.index, this.json}) : super(key: key);

  @override
  _news_itemState createState() => _news_itemState();
}

// ignore: camel_case_types
class _news_itemState extends State<news_item> {
  @override
  Widget build(BuildContext context) {
    return Swipe(
      onSwipeUp: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.json.length > widget.index + 1
                  ? news_item(json: widget.json, index: widget.index + 1)
                  : end_of_feed(),
            ));
      },
      onSwipeDown: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Image.network(widget.json[widget.index]['urlToImage'],
                      errorBuilder: (context, e, stack) => Image.network(
                          'https://freepikpsd.com/file/2019/10/image-not-available-png-2-Transparent-Images-Free.png')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Text(
                      widget.json[widget.index]['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      widget.json[widget.index]['description'],
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          height: 1.8),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                launch(widget.json[widget.index]['url']);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87)),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 35,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10, 0, 0),
                  child: Text(
                    'Tap to read more',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
