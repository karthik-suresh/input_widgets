import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

class MultilineInput extends StatefulWidget {
  final String text;
  final String hintText;

  MultilineInput({this.text, this.hintText});
  @override
  _MultilineInputState createState() => _MultilineInputState();
}

class _MultilineInputState extends State<MultilineInput> {
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
    return TextFormField(
      onSaved: (String value) {
        debugPrint('MultilineInput saved');
      },
      controller: myController,
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
      maxLines: 4,
      keyboardAppearance: Brightness.light,
    );
  }
}
