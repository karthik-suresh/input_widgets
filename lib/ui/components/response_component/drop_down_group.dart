import 'package:flutter/material.dart';
import 'package:input_widgets/utils/utils.dart';

class DropDownGroup extends StatefulWidget {
  final dynamic dropDownGroupComponent;
  DropDownGroup({Key key, this.dropDownGroupComponent}) : super(key: key);

  @override
  _DropDownGroupState createState() => _DropDownGroupState();
}

class _DropDownGroupState extends State<DropDownGroup> {
  String optionValue;
  dynamic dropDownGroupComponent;

  @override
  void initState() {
    dropDownGroupComponent = widget.dropDownGroupComponent;
    super.initState();
  }

  List<DropdownMenuItem<String>> choiceItemsWidget(List itemList) {
    List<DropdownMenuItem<String>> result = [];
    itemList.forEach((item) {
      DropdownMenuItem<String> itemWidget = DropdownMenuItem<String>(
        value: Utils.getContent(item),
        child: Text(Utils.getContent(item), textAlign: TextAlign.center),
      );
      if (itemWidget != null) {
        result.add(itemWidget);
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      child: SingleChildScrollView(
        child: ListBody(children: <Widget>[
          DropdownButton<String>(
            isExpanded: true,
            value: optionValue,
            underline: Container(
              height: 2,
              color: Colors.black87,
            ),
            onChanged: (String newValue) {
              setState(() {
                optionValue = newValue;
              });
            },
            items: choiceItemsWidget(dropDownGroupComponent['items']),
          )
        ]),
      ),
    );
  }
}
