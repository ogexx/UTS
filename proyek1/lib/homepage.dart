import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void main(List<String> args){
   runApp(MyWidget());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: "Belajar desain",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Belajar desain',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
     ),
    );
  }
}

class MyAppState extends ChangeNotifier{
  var current = WordPair.random();
  // add this.
  void getNext(){
    current = WordPair.random();
    notifyListeners();
  }
  var favorites = <WordPair>[];

  void toogleFavorite(){
    if(favorites.contains(current)){
      favorites.remove(current);
    }else{
      favorites.add(current);
    }
    notifyListeners();
  }
}
class MyHomePage extends StatelessWidget{
    @override
  Widget build(BuildContext context){
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;

    if(appState.favorites.contains(pair)){
      icon = Icons.favorite;
    }else{
      icon = Icons.favorite_border;
    }

     return Scaffold(
      body: Center(
        child: Column(
         mainAxisAlignment:
         MainAxisAlignment.center,
         children:[
          Text("moh farhan"),
          SizedBox(
            height: 10,
          ),
          //
          Text(appState.current.asLowerCase),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            ElevatedButton.icon(
              onPressed:(){
              appState.toogleFavorite();
             },
              icon:Icon(icon),
              label: Text("favorite"),
          ),
          ElevatedButton(
            onPressed: (){
              appState.getNext();
            },
            child: Text("Tekan Saya")
          )
         ],
        ),
      ],
      ),
     ),
     );
  }
}
class Bigcard extends StatelessWidget {
  const Bigcard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase,style:TextStyle(color: Colors.green),),
      ),
    );
  }
}
