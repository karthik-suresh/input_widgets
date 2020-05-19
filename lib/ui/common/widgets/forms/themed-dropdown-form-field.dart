import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

// void main() => runApp(MyApp());

// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: Center(
//           child: ThemedDropdownFormField(),
//         ),
//       ),
//     );
//   }
// }

class ThemedDropdownFormField extends StatefulWidget {
  ThemedDropdownFormField({Key key}) : super(key: key);

  @override
  _ThemedDropdownFormFieldState createState() =>
      _ThemedDropdownFormFieldState();
}

class _ThemedDropdownFormFieldState extends State<ThemedDropdownFormField> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: ThemeElements.displayTextStyle,
      underline: Container(
        height: 2,
        color: ThemeElements.primaryColorLight,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value,
              style: themeData.textTheme.headline6, textAlign: TextAlign.left),
        );
      }).toList(),
    );
  }
}
