import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _total = 0;
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();

  void _sumar() {
    setState(() {
      _total = int.parse(_numero1.text) + int.parse(_numero2.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _numero1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite el primer número",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: _numero2,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite el segundo número",
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton.icon(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                icon: const Icon(Icons.calculate_outlined, size: 30),
                label: const Text("Sumar"),
                onPressed: () {
                  _sumar();
                },
              ),
              Text(
                'La suma es $_total',
                style: const TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Ctrl Alt Shif l
