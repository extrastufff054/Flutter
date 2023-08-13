import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  
import 'dart:async';
import 'dart:convert';
void main()
{
  runApp(const MaterialApp
  (
    home : HomePage(),
  )
  );
}

class HomePage extends StatefulWidget
{
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  final String url = "https://jsonplaceholder.typicode.com/users";
  List data = [];

  @override
  void initState()
  {
    super.initState();
    getJsonData();
  }

  Future<String> getJsonData() async
  {
    var response = await http.get
    (
      //Encode the url
      Uri.parse(url),
      //Only accept JSON response
      headers: {"Accept":"application/json"}
    );
    print(response.body);

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson as List;
    });

    return "Success";
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Retrieve JSON via HTTP GET"),
      ),
      body: ListView.builder
      (
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context,int index)
        {
          return Container
          (
            child : Center
            (
              child: Column
              (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                [
                  Card
                  (
                    child: Container
                    (
                      padding: const EdgeInsets.all(20.0),
                      child: Text(data[index]['name']),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}