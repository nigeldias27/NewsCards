import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';

// ignore: camel_case_types
class end_of_feed extends StatelessWidget {
  const end_of_feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swipe(
      onSwipeDown: () {
        Navigator.pop(context);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.feed,
              size: 128,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'That\'s all for now. You are up to date with the current events',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 16, height: 1.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
