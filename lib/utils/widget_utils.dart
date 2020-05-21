import 'package:flutter/material.dart';

class WidgetUtils {
  static List<Widget> listOfTexts(List<String> texts) {
    List<Text> textItems = [];
    texts.forEach((text) {
      textItems.add(Text(text));
      textItems.add(Text(''));
    });
    return textItems;
  }
}
