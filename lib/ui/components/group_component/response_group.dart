import 'package:flutter/material.dart';
import 'package:input_widgets/utils/widget_utils.dart';

class ResponseComponent extends StatefulWidget {
  final dynamic responseComponent;
  ResponseComponent({Key key, this.responseComponent}) : super(key: key);

  @override
  _ResponseComponentState createState() => _ResponseComponentState();
}

class _ResponseComponentState extends State<ResponseComponent> {
  dynamic responseComponent;
  @override
  void initState() {
    responseComponent = widget.responseComponent;
    super.initState();
  }

  List<Widget> responseItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = WidgetUtils.classifyResponseComponent(item);
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
          children: responseItemsWidget(responseComponent['items']),
        ),
      ),
    );
  }
}
