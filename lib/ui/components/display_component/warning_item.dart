import 'package:flutter/material.dart';

class WarningItem extends StatelessWidget {
  final String text;
  const WarningItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.text, style: TextStyle(color: Colors.yellow));
  }
}
