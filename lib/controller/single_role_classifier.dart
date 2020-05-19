import 'package:flutter/material.dart';
import 'package:input_widgets/answer_widget.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-checkbox-form-field.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-dropdown-form-field.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-long-text-form-field.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-number-form-field.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-radio-form-field.dart';
import 'package:input_widgets/ui/common/widgets/forms/themed-text-form-field.dart';

class SingleRoleClassifier {
  dynamic itemComponent;
  SingleRoleClassifier({
    this.itemComponent,
  });

  static Widget classify(String role) {
    debugPrint("Role=" + role);
    switch (role) {
      case 'input':
        return ThemedTextFormField(
          hintText: "Answer here",
        );
        break;
      case 'multilineTextInput':
        return ThemedLongTextFormField(
          hintText: "Answer here",
          maxlines: 5,
        );
        break;
      case 'numberInput':
        return ThemedNumberFormField(
          hintText: "0-10",
        );
      case 'singleChoiceGroup':
        return ThemedRadioFormField();
      case 'multipleChoiceGroup':
        return Container(
          child: ThemedCheckboxFormField(),
        );
        break;
      case 'dropdownChoiceGroup':
        return ThemedDropdownFormField();
        break;
      default:
        return AnswerWidget();
    }
  }
}
