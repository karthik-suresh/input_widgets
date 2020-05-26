import 'package:flutter/material.dart';
import 'package:input_widgets/utils/utils.dart';
import 'package:input_widgets/utils/widget_utils.dart';

class MultipleChoiceGroup extends StatefulWidget {
  final dynamic multipleChoiceGroupComponent;
  MultipleChoiceGroup({Key key, this.multipleChoiceGroupComponent})
      : super(key: key);

  @override
  _MultipleChoiceGroupState createState() => _MultipleChoiceGroupState();
}

class _MultipleChoiceGroupState extends State<MultipleChoiceGroup> {
  Map<String, bool> optionValues = {};
  dynamic multipleChoiceGroupComponent;
  List choiceList;

  @override
  void initState() {
    multipleChoiceGroupComponent = widget.multipleChoiceGroupComponent;
    choiceList = multipleChoiceGroupComponent['items'];
    choiceList.forEach((item) {
      String key = Utils.getContent(item);
      optionValues[key] = false;
    });
    super.initState();
  }

  List<Widget> choiceItemsWidget() {
    List<Widget> result = [];
    choiceList.forEach((item) {
      String key = Utils.getContent(item);
      Widget itemWidget = CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: WidgetUtils.classifyMultipleChoiceGroupComponent(item),
        value: optionValues[key],
        onChanged: (bool value) {
          setState(() {
            optionValues[key] = value;
          });
        },
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
        child: ListBody(
          children: choiceItemsWidget(),
        ),
      ),
    );
  }
}
