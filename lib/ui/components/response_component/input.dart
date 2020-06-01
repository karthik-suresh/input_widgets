import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

class Input extends StatefulWidget {
  final String text;
  final String hintText;

  Input({this.text, this.hintText});
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  String text;
  String hintText;
  final myController = TextEditingController();

  @override
  void initState() {
    text = widget.text;
    hintText = widget.hintText;
    super.initState();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use myController.text to get the text value
    return TextFormField(
      onSaved: (String value) {
        debugPrint('Input saved' + value);
      },
      controller: myController,
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
      keyboardAppearance: Brightness.light,
    );
  }
}
