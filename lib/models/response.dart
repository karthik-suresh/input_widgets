import 'package:flutter/material.dart';

class ResponseModel with ChangeNotifier {
  String value;
  ResponseModel({
    this.value,
  });
  void response(String val) {
    value = val;
    debugPrint("Value at parent=" + val);
    notifyListeners();
  }
}
