import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.amber,
        textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 28.0,
            // fontStyle: FontStyle.italic,
            fontFamily: 'Poppins'
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text('Material App Bar'),
          // ),
          body: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _createBackground(context),
        Column(
          children: <Widget>[
            _createTitle(context),
          ],
        )
      ],
    );
  }


  Widget _createTitle(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity, // all width
        child: Text(
          'Free Fire Characters',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _createBackground(BuildContext context) {
    var boxWidget = Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor,
          ],
          // angulos de referencia
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      width: 300,
      height: 300,
    );
    return Positioned(
      top: -100,
      child: Transform.rotate(
        child: boxWidget,
        angle: -pi / 5.0,
      ),
    );
  }
}
