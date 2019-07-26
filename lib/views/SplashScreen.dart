import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:naldo_mobil_portfolio/common/VideoBgPositioned.dart';
import 'package:naldo_mobil_portfolio/localization/app_localizations.dart';
import 'package:naldo_mobil_portfolio/theme/Colors.dart';
import 'package:naldo_mobil_portfolio/theme/Styles.dart';
import 'package:naldo_mobil_portfolio/views/Home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SplashScreen extends StatelessWidget {

  final PopupMenuButton popUpMenu;

  SplashScreen({this.popUpMenu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          VideoBgPositioned(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.transparent,
                  AudiColors.grey.withOpacity(0.8),
                  AudiColors.grey
                ],
                //   stops: [0.0, 0.2, 1.0],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SafeArea(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                        child: popUpMenu
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Hero(
                            tag: 'RLogo',
                            child: Image.asset(
                              'assets/images/logoW.png',
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(AppLocalizations.of(context).translate('greet')),
                          Text(
                            'Reynaldo QS'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.3,
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)
                                .translate('na_professions'),
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.2,
                                color: AudiColors.amber),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            AppLocalizations.of(context)
                                .translate('na_description'),
                            style: AudiStyles.normalTextLighter,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context)
                                    .translate('btn_portfolio')
                                    .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 13),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                FontAwesomeIcons.arrowCircleRight,
                                color: Colors.black,
                                size: 18,
                              )
                            ],
                          ),
                          color: AudiColors.amber,
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomeView()),
                            );
                          },
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlineButton(
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('btn_link_resume')
                                .toUpperCase(),
                            style: AudiStyles.smallTextLighter,
                          ),
                          onPressed: () {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}