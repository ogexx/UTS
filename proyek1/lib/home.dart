import 'dart:html';

import 'package:flutter/material.dart';

void main(List<String> args) {
// runApp(App()); 
}
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "proyek1",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true), // ThemeData
    home: Dashboard(),
    );
  } // MaterialApp
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Text"),
          Text("Text"),
          ElevatedButton(
          onPressed: (){
            print('hello button');
          },
            child: Text("Tekan Saya")),
            Image(
              image: NetworkImage('https://via.assets.so/album.png?id=1&q=95&w=360&h=360&fit=fill'),
            )
        ]
      )
    );
  }
}