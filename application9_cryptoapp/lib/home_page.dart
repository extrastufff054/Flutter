import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List currencies;

  const HomePage(this.currencies, {super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CryptoCurrency App"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: ListView.builder(
        itemCount: widget.currencies.length,
        itemBuilder: (BuildContext context, int index) {
          final Map currency = widget.currencies[index];
          return _getListItemsUI(currency, index); // Pass the index
        },
      ),
    );
  }


 ListTile _getListItemsUI(Map currency, int index) {
    // Check if 'name' value is not null
    if (currency['name'] != null) {
      final MaterialColor color = _colors[index % _colors.length]; // Get color based on index
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: color, // Use the selected color for CircleAvatar
          child: Text(currency['name'][0]),
        ),
        title: Text(
          currency['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currency['price_usd'] != null) Text(currency['price_usd']),
            _getSubtitleText(currency['percent_change_1h']),
          ],
        ),
      );
    } else {
      // Handle case where 'name' is null
      return const ListTile(
        title: Text('N/A'), // Display a placeholder text
      );
    }
  }

  Widget _getSubtitleText(String percentageChange) {
    if (percentageChange == 'N/A') {
      return const Text('1 hour: N/A', style: TextStyle(color: Colors.black));
    }

    double changeValue = double.tryParse(percentageChange) ?? 0.0;

    TextSpan priceTextWidget = TextSpan(
      text: "1 hour: $percentageChange%\n",
      style: const TextStyle(color: Colors.black),
    );
    TextSpan percentageChangeTextWidget;

    if (changeValue > 0) {
      percentageChangeTextWidget = TextSpan(
        text: "1 hour: $percentageChange%",
        style: const TextStyle(color: Colors.green),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: "1 hour: $percentageChange%",
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
