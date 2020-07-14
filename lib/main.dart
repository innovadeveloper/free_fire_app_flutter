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
              fontFamily: 'Poppins'),
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
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _createTitle(context),
              _createCharactersTable(context),
            ],
          ),
        )
      ],
    );
  }

  Widget _createTitle(BuildContext context) {
    return SafeArea(
      child: Container(
        // color: Colors.red,
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

  Widget _createCharactersTable(BuildContext context) {
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            _createCharacterColumn(context, Colors.green),
            _createCharacterColumn(context, Colors.red),
          ],
        ),
        TableRow(
          children: <Widget>[
            _createCharacterColumn(context, Colors.green),
            _createCharacterColumn(context, Colors.red),
          ],
        ),
        TableRow(
          children: <Widget>[
            _createCharacterColumn(context, Colors.green),
            _createCharacterColumn(context, Colors.red),
          ],
        ),
      ],
    );
  }

  Widget _createCharacterColumn(BuildContext context, Color color) {
    final cornerRadius = 10.0;

    return ClipRect(
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: 300,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cornerRadius)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(cornerRadius),
            ),
            // color: Colors.red,
            child: Center(
              child: Stack(
                children: <Widget>[
                  // Center(child: CircularProgressIndicator()),
                  FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image:
                        'https://www.pockettactics.com/wp-content/uploads/2020/05/garena-free-fire-a124-628x913.jpg',
                  ),
                  
                ],
              ),
            ),
          ),
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
