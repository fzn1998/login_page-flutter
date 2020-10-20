import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = '';

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = 'Welcome ' + _userController.text;
      } else {
        _welcomeString = 'Invalid Details';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.white24,
        title: Text(
          'Login ',
          style: TextStyle(color: Colors.black45, fontSize: 40),
        ),
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Padding(padding: new EdgeInsets.only(top: 30.0)),
            new Image.asset(
              "images/face.png",
              width: 90.0,
              height: 80.0,
              color: Colors.black45,
            ),
            new Padding(padding: new EdgeInsets.only(top: 20.0)),
            new Container(
                height: 180.0,
                width: 360.0,
                color: Colors.white,
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _userController,
                      decoration: new InputDecoration(
                        hintText: 'Username',
                        icon: new Icon(Icons.person),
                      ),
                    ),
                    new TextField(
                      controller: _passwordController,
                      decoration: new InputDecoration(
                        hintText: 'Password',
                        icon: new Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    new Padding(padding: new EdgeInsets.all(10.5)),
                    new Center(
                        child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                            onPressed: _showWelcome,
                            color: Colors.black45,
                            child: new Text(
                              'Login',
                              style: new TextStyle(
                                  color: Colors.white70, fontSize: 16.9),
                            ),
                          ),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: new RaisedButton(
                            onPressed: _erase,
                            color: Colors.black45,
                            child: new Text(
                              'Clear',
                              style: new TextStyle(
                                  color: Colors.white70, fontSize: 16.9),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                )),
            new Padding(padding: new EdgeInsets.only(top: 21.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '$_welcomeString',
                  style: new TextStyle(color: Colors.black45, fontSize: 25.0),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
