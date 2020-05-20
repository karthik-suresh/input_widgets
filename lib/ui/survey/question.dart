import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;
  const Question({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Text(
      question,
      style: themeData.textTheme.headline6,
      textAlign: TextAlign.left,
    );
  }
}
