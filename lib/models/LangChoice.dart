//import 'package:flutter/material.dart';

class Choice {
  final String lang;
  final String langTitle;
  const Choice({this.langTitle, this.lang});
}

const List<Choice> choices = const <Choice>[
  const Choice(langTitle: 'Espanol', lang: 'es'),
  const Choice(langTitle: 'English', lang: 'en'),
  //const Choice(langTitle: 'Japanese', lang: 'jp'),
];

