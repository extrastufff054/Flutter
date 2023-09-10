import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class MyHomePage extends StatefulWidget
{
  List currencies;
  MyHomePage(this.currencies);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List _currencies=[];

  final List <MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Crypto App'),
        elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 1.0,
      ),
      body: _cryptoWidget
      (),
    );
  }

  Widget _cryptoWidget()
  {
    return Container
    (
      child: Column(
        children: <Widget>
        [
          Flexible
          (
            child : ListView.builder
            (
              itemCount : widget.currencies.length,
              itemBuilder : (BuildContext context, int index)
              {
                final Map currency = widget.currencies[index];
                final MaterialColor color = _colors[index % _colors.length];

                return _getListItemUi(currency, color);
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _getListItemUi(Map currency, MaterialColor color)
  {
    return ListTile
    (
      leading: CircleAvatar
      (
        backgroundColor: color,
        child: Text(currency['name'][0]),
      ),
      title: Text
      (
        currency['name'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(currency['current_price'], currency['price_change_percentage_24h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(num priceUSD, num percentageChange)
  {
    TextSpan priceTextWidget = TextSpan(
      text: "\$${priceUSD.toStringAsFixed(2)}\n", // Cast priceUSD to string and format it.
      style: const TextStyle(color: Colors.black),
    );

    String percentageChangeText = "24 hour: ${percentageChange.toStringAsFixed(2)}%";
    TextSpan percentageChangeTextWidget;

    if (percentageChange > 0) {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: const TextStyle(color: Colors.green),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: const TextStyle(color: Colors.red),
      );
    }

    return RichText(
      text: TextSpan(
        children: [priceTextWidget, percentageChangeTextWidget],
      ),
    );
  }

}