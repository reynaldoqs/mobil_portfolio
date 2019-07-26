import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naldo_mobil_portfolio/localization/app_localizations.dart';
import 'package:naldo_mobil_portfolio/views/SplashScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:naldo_mobil_portfolio/models/LangChoice.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _locale = 'en';
  Choice _selectedChoice = choices[1];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
      _locale = choice.lang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(_locale, ''),
      supportedLocales: [
        Locale('en', ''),
        Locale('es', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        popUpMenu: buildPopupMenuButton(),
      ),
    );
  }

  PopupMenuButton<Choice> buildPopupMenuButton() {
    return PopupMenuButton<Choice>(
        onSelected: _select,
        child: Image.asset('assets/images/langs/${_selectedChoice.lang}.png',
            width: 34),
        itemBuilder: (BuildContext context) {
          return choices.map((Choice choice) {
            return PopupMenuItem<Choice>(
              value: choice,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/images/langs/${choice.lang}.png',
                    width: 20,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    choice.langTitle,
                    style: TextStyle(
                        color: _selectedChoice == choice
                            ? Colors.white
                            : Colors.white30),
                  )
                ],
              ),
            );
          }).toList();
        },
      );
  }
}