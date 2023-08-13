import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      home : LoginPage(),
      theme : ThemeData
      (
        primarySwatch: Colors.blue
      )
    );
  }
}

class LoginPage extends StatefulWidget
{
  @override 
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin
{

  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;


  @override 
  void initState()
  {
    super.initState();
    _iconAnimationController = AnimationController
    (
      vsync : this,
      duration : Duration(milliseconds : 300)
    );
    _iconAnimation = CurvedAnimation
    (
      parent : _iconAnimationController,
      curve : Curves.easeInOutExpo
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      backgroundColor: Colors.black12,
      body : Stack
      (
        fit : StackFit.expand,
        children: <Widget>
        [
          const Image
          (
            image : AssetImage("assets/dog.jpeg"),
            fit : BoxFit.cover,
            color : Colors.black87,
            colorBlendMode : BlendMode.darken
          ),
          Column
          (
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children : <Widget>[
              FlutterLogo
              (
                size : _iconAnimation.value*100,
              ),
              Form
              (
                child : Theme(
                  data: ThemeData
                  (
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: const InputDecorationTheme
                    (
                      labelStyle: TextStyle
                      (
                        color: Colors.grey,
                        fontSize: 13.0
                      )
                    )
                  ),
                  child: Container(
                    padding : const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField
                        (
                          decoration : const InputDecoration
                          (
                            labelText: "Enter Email",

                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField
                        (
                          decoration : const InputDecoration
                          (
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        const Padding
                        (
                          padding: EdgeInsets.only(top: 20.0), 
                        ),
                        MaterialButton
                        (
                          height: 40.0,
                          minWidth: 100.0,
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: const Text("Login"),
                          onPressed: () => {},
                          splashColor: Colors.redAccent,
                        )
                      ],
                    ),
                  ),
                )
              ),
            ]
          )
        ],
      )
    );
  }
}