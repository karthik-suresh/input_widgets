import 'package:flutter/material.dart';
import 'package:input_widgets/controller/survey_single_item_view.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Influenzanet Survey',
      theme: influenzaNetTheme,
      home: SurveySingleItem(title: 'Survey questions'),
    );
  }
}
