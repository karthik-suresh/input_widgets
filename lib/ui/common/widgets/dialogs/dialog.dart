import 'package:flutter/material.dart';

void main() => runApp(MyApp());
const String _title = 'Flutter Code Sample';

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: _title, home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);
  static const title = "Question asked?";
  static List<String> textList = ['Text1', 'Text2'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              _showHelpGroup(context);
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.yellow,
            child: Text('Here'),
            onPressed: () async {
              _showHelpGroup(context);
            },
          ),
        ),
      ),
    );
  }

  Future<void> _showHelpGroup(context,
      {String title = "Help", List<String> textList}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(title),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
