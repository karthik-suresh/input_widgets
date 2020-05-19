import 'package:flutter/material.dart';
import 'package:input_widgets/answer_widget.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';
import 'package:input_widgets/ui/common/widgets/cards/themed-card.dart';

class MyWidget extends StatelessWidget {
  final String question;
  MyWidget({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
      child: Column(
        children: <Widget>[_inputLongTextFields(themeData, this.question)],
      ),
    );
  }

  Widget _inputLongTextFields(ThemeData themeData, String question) {
    return ThemedCard(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question,
              style: themeData.textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Container(
              height: ThemeElements.cardContentPadding,
            ),
            AnswerWidget(),
          ],
        ),
      ),
    );
  }
}
