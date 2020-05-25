import 'package:flutter/material.dart';
import 'package:input_widgets/utils/utils.dart';

class Question extends StatelessWidget {
  final dynamic questionComponent;
  Question({Key key, this.questionComponent}) : super(key: key);
  String _getQuestionContent() {
    return Utils.getContent(this.questionComponent);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Text(
      _getQuestionContent(),
      style: themeData.textTheme.headline6,
      textAlign: TextAlign.left,
    );
  }
}
