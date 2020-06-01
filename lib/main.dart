import 'package:flutter/material.dart';
import 'package:input_widgets/models/flattened_rendered.dart';
import 'package:input_widgets/models/survey_single_item.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';
import 'package:input_widgets/ui/survey/survey_single_item_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SurveySingleItemModel surveySingleItemModel =
        SurveySingleItemModel(surveySingleItem: qp[0]);
    return MaterialApp(
      title: 'Influenzanet Survey',
      theme: influenzaNetTheme,
      home: SurveySingleItemWidget(
          title: 'Survey questions',
          surveySingleItem: surveySingleItemModel.surveySingleItem),
    );
  }
}
