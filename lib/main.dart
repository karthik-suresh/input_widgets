import 'package:flutter/material.dart';
import 'package:input_widgets/models/flattened_rendered.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';
import 'package:input_widgets/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:input_widgets/ui/common/widgets/buttons/themed-primary-button.dart';
import 'package:input_widgets/ui/survey/question.dart';
import 'package:input_widgets/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Influenzanet Survey',
      theme: influenzaNetTheme,
      home: MyHomePage(title: 'Survey questions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  final questionItems = Utils.getQuestionList(qp);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  dynamic questions;
  @override
  void initState() {
    questions = widget.questionItems;
    super.initState();
  }

  void _nextQuestion() {
    setState(() {
      _index++;
      if (_index == questions.length) {
        _index = 0;
      }
    });
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
              return null;
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(ThemeElements.cardContentPadding),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Question(question: questions[_index]),
            ),
            // Container(
            //   padding: const EdgeInsets.all(12.0),
            //   child: SingleRoleClassifier.classify(questions[_index]['answer']),
            // ),
            Container(height: ThemeElements.elementPadding),
            ThemedPrimaryButton(
              Theme.of(context),
              primaryColor: true,
              text: 'Next',
              onPressed: _nextQuestion,
            )
          ],
        ),
      ),
    );
  }
}
