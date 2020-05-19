import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-long-text-form-field.dart';

class AnswerWidget extends StatelessWidget {
  final String answer;
  const AnswerWidget({Key key, this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ThemedLongTextFormField(
        hintText: "Answer here",
        maxlines: 5,
      ),
    );
  }
}
