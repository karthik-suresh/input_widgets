import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:input_widgets/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:input_widgets/ui/survey/question.dart';

class SurveySingleItem extends StatefulWidget {
  SurveySingleItem({Key key, this.title}) : super(key: key);

  final String title;
  final surveySingleItem = {};

  @override
  _SurveySingleItemState createState() => _SurveySingleItemState();
}

class _SurveySingleItemState extends State<SurveySingleItem> {
  dynamic surveySingleItem;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    surveySingleItem = widget.surveySingleItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemedAppBar(
        Theme.of(context),
        titleText: widget.title,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.help),
            onPressed: () async {
              _showHelpGroup(context);
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Question(
                        question:
                            'Title goes here with something present in the question'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Question(question: 'ResponseGroup flows here'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Visibility(
                        visible: true,
                        child: Text(
                            'Other text goes here  if not present becomes invisible')),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Visibility(
                        visible: true,
                        child: Text(
                            'Warning text goes here if not present becomes invisible')),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Visibility(
                        visible: true,
                        child: Text(
                            'Error text goes here  if not present becomes invisible')),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Builder(
                      builder: (context) => ThemedPrimaryButton(
                        Theme.of(context),
                        primaryColor: true,
                        text: 'Next',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Fetching next Survey Item')));
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showHelpGroup(context,
      {String title = "Content goes here", List<String> textList}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Help',
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(title),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
