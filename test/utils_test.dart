import 'dart:convert';

import 'package:input_widgets/models/flattened_rendered.dart';
import 'package:input_widgets/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group(
      'Test if Localised strings are fetched from rendered survey content :\n',
      () {
    List content;

    setUp(() {
      content = [
        {
          "code": "en",
          "parts": ["What is your main activity?"]
        },
        {
          "code": "de",
          "parts": ["Was ist Ihre Haupttätigkeit?"]
        }
      ];
      print(json.encode(content));
    });
    test('Check if English parts are fetched', () {
      expect(
          Utils.getPartsByCode(content, "en"), 'What is your main activity?');
    });

    test('Check if German parts are fetched', () {
      expect(
          Utils.getPartsByCode(content, "de"), 'Was ist Ihre Haupttätigkeit?');
    });
  });

  group('Test if content of a role is fetched appropriately :\n', () {
    List components;

    setUp(() {
      components = [
        {
          "role": "title",
          "content": [
            {
              "code": "en",
              "parts": [
                "Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?"
              ]
            },
          ]
        },
        {
          "role": "text",
          "content": [
            {
              "code": "en",
              "parts": ["Select all options that apply, if any"]
            },
            {
              "code": "de",
              "parts": [
                "Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen"
              ]
            }
          ]
        }
      ];
      print("Components=\n");
      print(json.encode(components));
    });
    test('Check if English parts are fetched from `title`', () {
      expect(Utils.getItemComponentContentByRole(components, "title"),
          'Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?');
    });

    test('Check if German parts are fetched from `text`', () {
      expect(
          Utils.getItemComponentContentByRole(components, "text", code: 'de'),
          'Wählen Sie alle entsprechenden Optionen aus, falls diese zutreffen');
    });
  });

  group('Get questions from a list of Survey Single Items :\n', () {
    dynamic surveySingleItem;

    setUp(() {
      surveySingleItem = qp;
      print("Components=\n");
      print(json.encode(surveySingleItem));
    });
    test('Check if all questions are fetched appropriately in a list', () {
      List<String> expected = [
        'What is your main activity?',
        'Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?',
        'Except people you meet on public contact, do you have contact with any of the following during the course of a typical day?',
        'INCLUDING YOU, how many people in each of the following age groups live in your household?'
      ];

      expect(json.encode(Utils.getQuestionList(surveySingleItem)),
          json.encode(expected));
    });
  });
}
