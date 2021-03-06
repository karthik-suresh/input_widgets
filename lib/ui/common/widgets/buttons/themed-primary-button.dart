import 'package:flutter/material.dart';
import 'package:input_widgets/ui/common/themes/influenzanet-theme.dart';

class ThemedPrimaryButton extends FlatButton {
  factory ThemedPrimaryButton(ThemeData themeData,
      {String text = '', void Function() onPressed, bool primaryColor = true}) {
    return ThemedPrimaryButton.widget(
      themeData,
      primaryColor: primaryColor,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: ThemeElements.bigButtonTextStyle.apply(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }

  ThemedPrimaryButton.widget(ThemeData themeData,
      {Widget child, void Function() onPressed, bool primaryColor = true})
      : super(
          color: primaryColor ? themeData.primaryColor : themeData.accentColor,
          splashColor: primaryColor
              ? ThemeElements.primarySwatch[500]
              : ThemeElements.accentSwatch[400],
          padding: ThemeElements.bigButtonPaddingGeometry,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: child,
          onPressed: onPressed,
          //elevation: 0,
        );
}
