import 'package:flutter/material.dart';
import 'chat_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat App",
          style: TextStyle(
            color: Color.fromARGB(220, 39, 40, 41), // Text color of the title
            fontSize: 24.0, // Font size of the title
            ),
        ),
        backgroundColor: Color.fromARGB(172, 220, 239, 248), // Background color of the AppBar
        elevation: 0.0,
        centerTitle: true, // Center the title horizontally
        // You can add more customization here, such as actions or icons
      ),
      body:ChatScreen(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
