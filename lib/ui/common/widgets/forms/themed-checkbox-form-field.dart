import 'package:flutter/material.dart';

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
          child: ThemedCheckboxFormField(),
        ),
      ),
    );
  }
}

class ThemedCheckboxFormField extends StatefulWidget {
  @override
  ThemedCheckboxFormFieldState createState() =>
      new ThemedCheckboxFormFieldState();
}

class ThemedCheckboxFormFieldState extends State<ThemedCheckboxFormField> {
  Map<String, bool> values = {
    'Item1': false,
    'Item2': false,
  };

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 400.0,
          child: ListView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            children: values.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key,
                    style: themeData.textTheme.headline6,
                    textAlign: TextAlign.center),
                value: values[key],
                onChanged: (bool value) {
                  setState(() {
                    values[key] = value;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
