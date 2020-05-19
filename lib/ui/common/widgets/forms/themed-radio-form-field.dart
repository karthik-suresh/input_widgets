import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: ThemedRadioFormField(),
        ),
      ),
    );
  }
}

class ThemedRadioFormField extends StatefulWidget {
  ThemedRadioFormField({Key key}) : super(key: key);

  @override
  _ThemedRadioFormFieldState createState() => _ThemedRadioFormFieldState();
}

class _ThemedRadioFormFieldState extends State<ThemedRadioFormField> {
  SingingCharacter _character = SingingCharacter.lafayette;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Lafayette',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center),
          leading: Radio(
            value: SingingCharacter.lafayette,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: Text('Thomas Jefferson',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center),
          leading: Radio(
            value: SingingCharacter.jefferson,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
