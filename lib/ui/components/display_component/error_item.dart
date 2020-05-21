import 'package:flutter/material.dart';

class ErrorItem extends StatelessWidget {
  final String text;
  const ErrorItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(color: Colors.red));
  }
}
