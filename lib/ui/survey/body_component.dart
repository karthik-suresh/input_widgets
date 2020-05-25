import 'package:flutter/material.dart';
import 'package:input_widgets/utils/widget_utils.dart';

class Body extends StatefulWidget {
  final dynamic bodyComponent;
  Body({Key key, this.bodyComponent}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  dynamic bodyComponent;
  @override
  void initState() {
    bodyComponent = widget.bodyComponent;
    debugPrint('Item body:\n' + bodyComponent.toString());
    super.initState();
  }

  List<Widget> bodyItemsWidget(List itemList) {
    List<Widget> result = [];
    itemList.forEach((item) {
      Widget itemWidget = WidgetUtils.classify(item);
      if (itemWidget != null) {
        result.add(itemWidget);
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: ListBody(
          children: bodyItemsWidget(bodyComponent),
        ),
      ),
    );
  }
}
