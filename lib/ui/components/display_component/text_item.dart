import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  final String text;
  const TextItem({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.text);
  }
}
