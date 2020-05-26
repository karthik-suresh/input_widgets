import 'package:flutter/material.dart';
import 'package:input_widgets/ui/components/display_component/error_item.dart';
import 'package:input_widgets/ui/components/display_component/text_item.dart';
import 'package:input_widgets/ui/components/display_component/warning_item.dart';
import 'package:input_widgets/ui/components/group_component/response_group.dart';
import 'package:input_widgets/ui/components/response_component/themed-long-text-form-field.dart';
import 'package:input_widgets/ui/components/response_component/themed-number-form-field.dart';
import 'package:input_widgets/ui/components/response_component/themed-text-form-field.dart';
import 'package:input_widgets/utils/utils.dart';

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
          child: TextItem(textComponent: itemComponent),
        );
      case 'error':
        return Container(
          padding: const EdgeInsets.all(2.0),
          child: ErrorItem(errorComponent: itemComponent),
        );

      case 'warning':
        return Container(
          padding: const EdgeInsets.all(2.0),
          child: WarningItem(warningComponent: itemComponent),
        );

      default:
        debugPrint('Invalid role/role not implemented');
        return null;
    }
  }

  static Widget classifyResponseComponent(dynamic responseComponent) {
    switch (responseComponent['role']) {
      case 'input':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: ThemedTextFormField(
                hintText: Utils.getContent(responseComponent)));
      case 'multilineTextInput':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: ThemedLongTextFormField(
                hintText: Utils.getContent(responseComponent)));
      case 'numberInput':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: ThemedNumberFormField(
                hintText: Utils.getContent(responseComponent)));
      case 'singleChoiceGroup':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: Text('Single choice flows here'));
      case 'multipleChoiceGroup':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: Text('Multiple choice flows here'));
      case 'dropdownChoiceGroup':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: Text('Dropdown choice flows here'));
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }
}
