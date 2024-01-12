import 'package:flashcard_app/flashcard_list_screen.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flashcard Quiz App',
      home: FlashcardListScreen(),
    );
  }
}















/*import 'package:flash_card/flash_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: flashCard.length,
            itemBuilder: (context, index) {
              return flashCard[index];
            }));
  }

  final List<FlashCard> flashCard = List.generate(
      5,
      (index) => FlashCard(
            key: Key(index.toString()),
            frontWidget: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://fn.vinhphuc.edu.vn/UploadImages/mnhoanglau/admin/anh%20nha.jpg?w=700',
                      width: 100,
                      height: 100,
                    ),
                    const Text.rich(TextSpan(
                        text: 'Nghĩa:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: [
                          TextSpan(
                            text: 'Ngôi nhà',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ])),
                    const Text.rich(TextSpan(
                        text: 'Phiên âm:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        children: [
                          TextSpan(
                            text: '/həʊm/',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ])),
                    Container(
                      height: 40,
                      width: 40,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 2),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 2),
                                spreadRadius: 1,
                                blurRadius: 15)
                          ]),
                      child: const Center(
                          child: Icon(Icons.volume_down_sharp,
                              color: Colors.blue)),
                    ),
                  ],
                )),
            backWidget: Container(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'Home $index',
                  style: const TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            width: 300,
            height: 400,
          ));
}*/