import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'home_page.dart';

void main() async {
  final List currencies = await _getCurrencies();
  runApp(MyApp(currencies)); // Pass the fetched currencies to MyApp
}

class MyApp extends StatelessWidget {
  final List currencies;

  const MyApp(this.currencies, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrency App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
      ),
      home: HomePage(currencies),
    );
  }
}

Future<List> _getCurrencies() async {
  String cryptoUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false";
  Uri uri = Uri.parse(cryptoUrl);
  http.Response response = await http.get(uri);

  if (response.statusCode == 200 && response.body.isNotEmpty) {
    print("Response body: ${response.body}"); // Print the response body for debugging
    return json.decode(response.body);
  } else {
    print("API request failed with status code: ${response.statusCode}");
    return []; // Return an empty list or handle the error appropriately
  }
}

