import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key); // Fixed the key parameter

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSubtraction() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMultiplication() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDivision() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 ~/ num2; // Used integer division
    });
  }

  void doClear()
  {
    setState(() {
      t1.text = "0";
      t2.text = "0";
      sum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Output : $sum",
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter first number',
              ),
              controller: t1,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                hintText: 'Enter second number', // Changed the hintText
              ),
              controller: t2,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("+"),
                  onPressed: doAddition, // Changed to a function reference
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
                ElevatedButton(
                  child: Text("-"),
                  onPressed: doSubtraction, // Changed to a function reference
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text("*"),
                  onPressed: doMultiplication, // Changed to a function reference
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
                ElevatedButton(
                  child: Text("/"),
                  onPressed: doDivision, // Changed to a function reference
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
            const Padding
            (
              padding: EdgeInsets.only(top: 10.0),
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>
              [
                MaterialButton
                (
                  child: const Text("Clear"),
                  color : Colors.greenAccent,
                  onPressed: doClear,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
