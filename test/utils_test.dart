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
}
