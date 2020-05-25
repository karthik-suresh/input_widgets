import 'package:flutter/material.dart';

class WidgetUtils {
  static Widget classify(dynamic itemComponent) {
    debugPrint("Item component==" + itemComponent.toString());
    switch (itemComponent['role']) {
      case 'title':
        return null;
        break;
      case 'helpGroup':
        return null;
        break;
      case 'responseGroup':
        return Container(
          padding: const EdgeInsets.all(6.0),
          child: Text('ResponseGroup flows here'),
        );
      case 'text':
        return Container(
          padding: const EdgeInsets.all(6.0),
          child: Text('Text flows here'),
        );
      case 'error':
        return Container(
          padding: const EdgeInsets.all(6.0),
          child: Text('Error flows here'),
        );
        break;
      case 'warning':
        return Container(
          padding: const EdgeInsets.all(6.0),
          child: Text('Warning flows here'),
        );
        break;
      default:
        debugPrint('Invalid role/role not implemented');
        return null;
    }
  }
}
