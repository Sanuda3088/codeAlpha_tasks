import 'package:http/http.dart' as http;
import 'package:fl_pr_002/HomeScreen.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  String quotesText;
  String authorName;
  Screen2({Key? key,required this.quotesText,required this.authorName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(quotesText),
            Text(authorName),
          ],
        )
      ),
    );
  }
}
