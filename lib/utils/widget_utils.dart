import 'package:flutter/material.dart';
import 'package:input_widgets/ui/components/display_component/error_item.dart';
import 'package:input_widgets/ui/components/display_component/text_item.dart';
import 'package:input_widgets/ui/components/display_component/warning_item.dart';
import 'package:input_widgets/ui/components/group_component/response_group.dart';
import 'package:input_widgets/ui/components/response_component/input.dart';
import 'package:input_widgets/ui/components/response_component/multiline_input.dart';
import 'package:input_widgets/ui/components/response_component/multiple_choice_group.dart';
import 'package:input_widgets/ui/components/response_component/number_input.dart';
import 'package:input_widgets/ui/components/response_component/single_choice_group.dart';
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
            child: Input(hintText: Utils.getContent(responseComponent)));
      case 'multilineTextInput':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child:
                MultilineInput(hintText: Utils.getContent(responseComponent)));
      case 'numberInput':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: NumberInput(hintText: Utils.getContent(responseComponent)));
      case 'singleChoiceGroup':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: SingleChoiceGroup(
                singleChoiceGroupComponent: responseComponent));
      case 'multipleChoiceGroup':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: MultipleChoiceGroup(
                multipleChoiceGroupComponent: responseComponent));
      case 'dropdownChoiceGroup':
        return Container(
            padding: const EdgeInsets.all(2.0),
            child: Text('Dropdown choice flows here'));
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static Widget classifySingleChoiceGroupComponent(dynamic choiceComponent) {
    switch (choiceComponent['role']) {
      case 'option':
        return Text(Utils.getContent(choiceComponent),
            textAlign: TextAlign.left);
      case 'input':
        return Input(hintText: Utils.getContent(choiceComponent));
      case 'numberInput':
        return NumberInput(hintText: Utils.getContent(choiceComponent));
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }

  static Widget classifyMultipleChoiceGroupComponent(dynamic choiceComponent) {
    switch (choiceComponent['role']) {
      case 'option':
        return Text(Utils.getContent(choiceComponent),
            textAlign: TextAlign.left);
      case 'input':
        return Input(hintText: Utils.getContent(choiceComponent));
      default:
        debugPrint('Invalid or not implemented response component');
        return null;
    }
  }
}
