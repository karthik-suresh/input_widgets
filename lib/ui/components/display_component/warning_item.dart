import 'package:flutter/material.dart';
import 'package:input_widgets/utils/utils.dart';

class WarningItem extends StatelessWidget {
  final dynamic warningComponent;
  const WarningItem({Key key, this.warningComponent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(Utils.getContent(this.warningComponent),
        style: TextStyle(color: Colors.orange));
  }
}
