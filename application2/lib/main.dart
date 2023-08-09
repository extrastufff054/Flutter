import 'package:flutter/material.dart';

void main() {

    runApp(MyWidget());
}

class MyWidget extends StatelessWidget 
{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      home : Scaffold
      (
        // appBar: AppBar
        // (
        //   title : const Center
        //   (
        //     child : Text('Application 2')
        //   ),
        //   backgroundColor: const Color.fromARGB(236, 37, 36, 36),
        // ),
        body : SafeArea(
          child: Row
          (
            mainAxisAlignment : MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container(
              //     width : double.infinity,
              // ),
              Container
              (
                color : Color.fromARGB(235, 41, 154, 247),
                width : 100.0,
                height: 150.0,
                padding : const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                //margin : const EdgeInsets.all(150.0),
                child : const Text(
                  "Row 1",
                  style : TextStyle
                  (
                    color : Colors.white,
                    fontSize : 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ),
              Container
              (
                color : Color.fromARGB(235, 83, 187, 235),
                width : 100.0,
                height: 150.0,
                padding : const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                //margin : const EdgeInsets.all(150.0),
                child : const Text(
                  "Row 2",
                  style : TextStyle
                  (
                    color : Colors.white,
                    fontSize : 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ),
              Container
              (
                color : Color.fromARGB(199, 65, 198, 231),
                width : 100.0,
                height: 150.0,
                padding : const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                //margin : const EdgeInsets.all(150.0),
                child : const Text(
                  "Row 3",
                  style : TextStyle
                  (
                    color : Colors.white,
                    fontSize : 20.0,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ),
            ],
          )
        ),
      )
    );
  }
}