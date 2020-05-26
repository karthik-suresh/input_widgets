import 'package:flutter/material.dart';
import 'package:input_widgets/utils/utils.dart';

class TextItem extends StatelessWidget {
  final dynamic textComponent;
  const TextItem({Key key, this.textComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Utils.getContent(this.textComponent));
  }
}
