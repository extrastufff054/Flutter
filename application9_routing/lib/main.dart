import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'newpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch : Colors.blueGrey,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS
            ? Colors.grey[50]
            : null,
      ),
      home : HomePage(),
      // initialRoute: '/',
      // routes: <String, WidgetBuilder> {
      //   '/': (context) => HomePage(),
      //   '/a': (context) => NewPage("Home Page"),
      //   // '/b': (context) => NewPage(title: "Page B"),
      //   // '/c': (context) => NewPage(title: "Page C"),
      // },
    );
  }
}


class CustomCircleAvatar extends StatelessWidget {
  final bool isIOS;

  CustomCircleAvatar({required this.isIOS});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: isIOS ? Colors.deepPurple : Colors.white,
      child: const Text(
        "SV",
        style: TextStyle(
          fontSize: 35.0,
          color: Colors.black,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  void closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = Theme.of(context).platform == TargetPlatform.iOS;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sarang Vehale"),
              accountEmail: const Text("abc@gmail.com"),
              currentAccountPicture: CustomCircleAvatar(isIOS: isIOS),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundColor: isIOS ? Colors.deepPurple : Colors.white,
                  child: const Text(
                    "K",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text('Home'),
              trailing: const Icon(Icons.home),
              onTap:()
              {
                Navigator.of(context).pop();
                //Navigator.of(context).pushNamed('/a');
                Navigator.of(context).push
                (
                  MaterialPageRoute
                  (
                    builder: (BuildContext context) => NewPage("Page 1"),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Page 2'),
              trailing: const Icon(Icons.arrow_forward),
              onTap:()
              {
                Navigator.of(context).pop();
                //Navigator.of(context).pushNamed('/a');
                Navigator.of(context).push
                (
                  MaterialPageRoute
                  (
                    builder: (BuildContext context) => NewPage("Page 2"),
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () => closeDrawer(context),
              child: const ListTile(
                title: Text('Close'),
                trailing: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: const Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}
