import 'package:flutter/material.dart';

void main()
{
  runApp
  (
    MaterialApp
    (
      home : Scaffold
      (
        appBar: AppBar
        (
          title : const Center
          (
            child : Text("Application 1"),
          ),
          backgroundColor: const Color.fromARGB(255, 40, 41, 42),
        ),
        body : const Center
        (
          child : Image
          (
            image: AssetImage("images/image1.jpg"),
            width: 500,
            height : 600,
            fit : BoxFit.cover,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      ),
    )
  );
}