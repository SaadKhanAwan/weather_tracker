import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan MB', fontSize: 55.0, fontWeight: FontWeight.bold);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.grey),
    ),
    hintText: "Enter city name",
    hintStyle: TextStyle(fontSize: 20, color: Colors.grey));
