import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: ThemedNumberFormField(),
        ),
      ),
    );
  }
}

class ThemedNumberFormField extends TextFormField {
  ThemedNumberFormField(
      {String initialValue,
      String hintText,
      bool obscureText = false,
      TextInputType keyboardType = TextInputType.number,
      bool readOnly: false,
      bool autocorrect: false})
      : super(
          initialValue: initialValue,
          style: ThemeElements.bigButtonTextStyle,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: ThemeElements.bigButtonTextStyle,
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            filled: true,
            focusColor: ThemeElements.primaryColorLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: obscureText,
          keyboardType: keyboardType,
          keyboardAppearance: Brightness.light,
          readOnly: readOnly,
          autocorrect: autocorrect,
        );
}
