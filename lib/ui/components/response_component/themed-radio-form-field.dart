import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

void main() => runApp(MyApp());

class TimeValue {
  final int _key;
  final String _value;
  TimeValue(this._key, this._value);
}

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          body: Column(
            children: <Widget>[
              ThemedRadioFormField(),
            ],
          )),
    );
  }
}

class ThemedRadioFormField extends StatefulWidget {
  ThemedRadioFormField({Key key}) : super(key: key);

  @override
  _ThemedRadioFormFieldState createState() => _ThemedRadioFormFieldState();
}

class _ThemedRadioFormFieldState extends State<ThemedRadioFormField> {
  int _currentTimeValue = 1;

  final _buttonOptions = [
    TimeValue(30, "30 minutes"),
    TimeValue(60, "1 hour"),
    TimeValue(120, "2 hours"),
    TimeValue(240, "4 hours"),
    TimeValue(480, "8 hours"),
    TimeValue(720, "12 hours"),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 400.0,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            children: _buttonOptions
                .map((timeValue) => RadioListTile(
                      groupValue: _currentTimeValue,
                      title: Text(timeValue._value,
                          style: themeData.textTheme.headline6,
                          textAlign: TextAlign.left),
                      value: timeValue._key,
                      onChanged: (val) {
                        setState(() {
                          debugPrint('VAL = $val');
                          _currentTimeValue = val;
                        });
                      },
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
