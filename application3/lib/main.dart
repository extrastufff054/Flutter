import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Application 3",
      home: const Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
          brightness: Brightness.light,
        ),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String mytext = "Hello World";

  void _changeText() {
    setState(() {
      if (mytext.startsWith("H"))
        mytext = "Welcome to Application 3";
      else
        mytext = "Hello world!!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Application 3"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text
              (
                mytext,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Script MT Bold",
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: _changeText,
        backgroundColor: Colors.red,
      ),
    );
  }
}
