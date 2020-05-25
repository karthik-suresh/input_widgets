import 'package:flutter/material.dart';
import 'package:input_widgets/ui/components/display_component/error_item.dart';
import 'package:input_widgets/ui/components/display_component/text_item.dart';
import 'package:input_widgets/ui/components/display_component/warning_item.dart';

class WidgetUtils {
  static Widget classify(dynamic itemComponent) {
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
          child: TextItem(text: 'Text flows here'),
        );
      case 'error':
        return Container(
          padding: const EdgeInsets.all(6.0),
          child: ErrorItem(text: 'Error flows here'),
        );
        break;
      case 'warning':
        return Container(
          padding: const EdgeInsets.all(6.0),
          child: WarningItem(text: 'Warning flows here'),
        );
        break;
      default:
        debugPrint('Invalid role/role not implemented');
        return null;
    }
  }
}
