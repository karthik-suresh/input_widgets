import 'package:flutter/material.dart';
import 'package:input_widgets/utils/utils.dart';
import 'package:input_widgets/utils/widget_utils.dart';

class SingleChoiceGroup extends StatefulWidget {
  final dynamic singleChoiceGroupComponent;
  SingleChoiceGroup({Key key, this.singleChoiceGroupComponent})
      : super(key: key);

  @override
  _SingleChoiceGroupState createState() => _SingleChoiceGroupState();
}

class _SingleChoiceGroupState extends State<SingleChoiceGroup> {
  String optionValue;
  dynamic singleChoiceGroupComponent;

  @override
  void initState() {
    singleChoiceGroupComponent = widget.singleChoiceGroupComponent;
    super.initState();
  }

  List<Widget> choiceItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = RadioListTile(
        groupValue: optionValue,
        title: WidgetUtils.classifySingleChoiceGroupComponent(item),
        value: Utils.getContent(item),
        onChanged: (val) {
          setState(() {
            debugPrint('Selected value = $val');
            optionValue = val;
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
          children: choiceItemsWidget(singleChoiceGroupComponent['items']),
        ),
      ),
    );
  }
}
