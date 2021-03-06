import 'package:flutter/material.dart';
import 'package:input_widgets/models/response.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';
import 'package:input_widgets/utils/utils.dart';
import 'package:provider/provider.dart';

class NumberInput extends StatefulWidget {
  final String text;
  final String hintText;
  final String itemKey;

  NumberInput({this.text, this.hintText, this.itemKey});
  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  String text;
  String hintText;
  String itemKey;
  final myController = TextEditingController();

  @override
  void initState() {
    text = widget.text;
    hintText = widget.hintText;
    itemKey = widget.itemKey;
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
        debugPrint('NumberInput saved');
        ResponseModel responseModel =
            Provider.of<ResponseModel>(context, listen: false);
        dynamic response = Utils.constructSingleResponseItem(
            key: itemKey,
            value: value,
            responseItem: responseModel.getResponseItem());
        responseModel.setResponseItem(response);
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
      keyboardType: TextInputType.number,
    );
  }
}
