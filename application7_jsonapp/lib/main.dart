import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp
  (
    MaterialApp
    (
      theme : ThemeData
      (
        primarySwatch: Colors.blue,
      ),
      home : HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget
{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
{
  List data = [];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text("JSON App"),
      ),
      body: Container
      (
        child : Center
        (
          child : FutureBuilder
          (
            future : DefaultAssetBundle.of(context).loadString('load_json/person.json'),
            builder: (context, snapshot)
            {
              // Decode the JSON
              var mydata = jsonDecode(snapshot.data.toString());

              return ListView.builder
              (
                itemBuilder: (BuildContext context, int index)
                {
                  return Card
                  (
                    child : Column
                    (
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>
                      [
                        Text("Name : " + mydata[index]['name']),
                        Text("Age : " + mydata[index]['age'].toString()),
                        Text("Country : " + mydata[index]['country']),
                        Text("Gender : " + mydata[index]['gender']),
                        Text("Hobbies: " + (mydata[index]['hobbies'] as List).join(', ')),                       ],
                    )
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        )
      ),
    );
  }
}