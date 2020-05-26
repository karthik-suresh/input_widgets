import 'package:flutter/material.dart';
import 'package:input_widgets/ui/components/display_component/error_item.dart';
import 'package:input_widgets/ui/components/display_component/text_item.dart';
import 'package:input_widgets/ui/components/display_component/warning_item.dart';
import 'package:input_widgets/ui/components/group_component/response_group.dart';

class WidgetUtils {
  static Widget classifyRootComponent(dynamic itemComponent) {
    switch (itemComponent['role']) {
      case 'title':
        return null;
      case 'helpGroup':
        return null;
      case 'responseGroup':
        return Container(
          padding: const EdgeInsets.all(2.0),
          child: ResponseComponent(responseComponent: itemComponent),
        );
      case 'text':
        return Container(
          padding: const EdgeInsets.all(2.0),
          child: TextItem(text: 'Text flows here'),
        );
      case 'error':
        return Container(
          padding: const EdgeInsets.all(2.0),
          child: ErrorItem(text: 'Error flows here'),
        );

      case 'warning':
        return Container(
          padding: const EdgeInsets.all(2.0),
          child: WarningItem(text: 'Warning flows here'),
        );

      default:
        debugPrint('Invalid role/role not implemented');
        return null;
    }
  }

  static Widget classifyResponseComponent(dynamic responseComponent) {
    switch (responseComponent['role']) {
      case 'input':
        return Text('Input flows here');

      case 'multilineTextInput':
        return Text('Long Input flows here');

      case 'numberInput':
        return Text('Number Input flows here');

      case 'singleChoiceGroup':
        return Text('Single choice flows here');

      case 'multipleChoiceGroup':
        return Text('Multiple choice flows here');
      case 'dropdownChoiceGroup':
        return Text('Dropdown choice flows here');
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }
}
