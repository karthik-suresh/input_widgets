import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

class MultilineInput extends TextField {
  MultilineInput(
      {String hintText,
      int maxlines,
      bool readOnly: false,
      bool autocorrect: false})
      : super(
          style: ThemeElements.longTextFormFieldTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: ThemeElements.longTextFormFieldTextStyle,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            filled: true,
            focusColor: ThemeElements.primaryColorLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          keyboardType: TextInputType.multiline,
          keyboardAppearance: Brightness.light,
          maxLines: maxlines,
          readOnly: readOnly,
          autocorrect: autocorrect,
        );
}