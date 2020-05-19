import 'package:flutter/material.dart';
import 'package:input_widgets/my_widget.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';
import 'package:input_widgets/ui/common/widgets/app-bars/themed-app-bar.dart';
import 'package:input_widgets/ui/common/widgets/buttons/themed-primary-button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  final List<String> questions = [
    'What is your main activity?',
    'What is the first part of your school/college/workplace postal code (where you spend the majority of your working/studying time)?',
    'Which of the following texts most closely matches with your main occupation?',
    'Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?',
    'INCLUDING YOU, how many people in each of the following age groups live in your household?'
  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  List<String> questions;
  @override
  void initState() {
    questions = widget.questions;
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
      appBar: ThemedAppBar(Theme.of(context), titleText: widget.title),
      body: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: ThemeElements.pagePadding,
                  top: ThemeElements.pagePadding,
                  right: ThemeElements.pagePadding,
                ),
                child: MyWidget(question: questions[_index]),
              ),
              Container(height: ThemeElements.elementPadding),
              ThemedPrimaryButton(
                Theme.of(context),
                primaryColor: true,
                text: 'Next',
                onPressed: _nextQuestion,
              )
            ],
          )
        ],
      ),
    );
  }
}
