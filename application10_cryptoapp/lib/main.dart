import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Add this line for JSON decoding.
import 'homepage.dart';

void main() async
{
  List currencies = await getCurrencies();
  print(currencies);
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget
{
  final List _currencies;

  const MyApp(this._currencies);
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Crypto App',
      theme: ThemeData
      (
        primarySwatch : Colors.amber,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null,
      ),
      home:  MyHomePage(_currencies),
    );
  }
}

Future<List> getCurrencies() async
  {
    String cryptoUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1";
    http.Response response = await http.get(Uri.parse(cryptoUrl));

    return json.decode(response.body);
  }