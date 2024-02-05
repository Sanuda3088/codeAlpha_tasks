
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:share/share.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color.fromARGB(255, 238, 221, 188),
          child: Padding(
            padding: EdgeInsets.only(top: height*0.2,left:15,right: 15),
            child: Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 4, 193, 180),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          quote,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "-$author-",
                              style: const TextStyle(fontSize: 18),
                            )),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    var url = Uri.parse("https://api.api-ninjas.com/v1/quotes?");
                    var api = "2ov5G001C7zSOWSWsC7mTQ==EjE9ARRu56l2119z";
                    try {
                      var response =
                          await http.get(url, headers: {'X-Api-Key': api});
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');
                      if (response.statusCode == 200) {
                        var data = jsonDecode(response.body);
                        if (data is List && data.isNotEmpty) {
                          var firstQuote = data.first;
                          if (firstQuote is Map) {
                            quote = firstQuote["quote"] ?? "";
                            author = firstQuote["author"] ?? "";
                            setState(() {});
                          }
                        }
                      } else {
                        print(
                            'Request failed with status: ${response.statusCode}.');
                      }
                    } catch (e) {
                      print('Request failed with error: $e.');
                    }
                  },
                  child: const Text("Get quote!"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Share.share("$quote\n-$author");
                  },
                  child: const Text("Share quote!"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
