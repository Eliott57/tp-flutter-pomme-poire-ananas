import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  final List<int> _list = [1];

  void _incrementCounter() {
    setState(() {
      _counter++;
      _list.add(_counter);
    });
  }

  bool _isPair(int number){
    return number % 2 == 0;
  }

  bool _isPrime(int number) {
    if(number <= 1) {
      return false;
    }

    for (var i = 2; i <= number / i; ++i) {
      if (number % i == 0) {
        return false;
      }
    }

    return true;
  }

  String _currentImage(int number){
    if(_isPrime(number)) {
      return 'images/ananas.png';
    }

    if(_isPair(number)) {
      return 'images/poire.png';
    }

    return 'images/pomme.png';
  }

  String _currentNumberType(){
    if(_isPrime(_counter)) {
      return 'Nombre premier';
    }

    if(_isPair(_counter)) {
      return 'Pair';
    }

    return 'Impair';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
            '${_list[_counter-1]} : ${_currentNumberType()}',
            style: const TextStyle(
              color: Colors.white
            )
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(),
            margin: EdgeInsets.zero,
            color: _isPair(index) ?
              Colors.cyan :
              Colors.indigo,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:  Row(
                  children: <Widget>[
                    Image(
                        image: AssetImage(
                            _currentImage(_list[index])
                        ),
                        height: 50,
                        fit:BoxFit.fill
                    ),
                    Text(
                        _list[index].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        )
                    ),
                  ]
              ),
            ),
          );
        },
        itemCount: _list.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
