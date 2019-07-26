import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naldo_mobil_portfolio/localization/app_localizations.dart';
import 'package:naldo_mobil_portfolio/models/Project.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naldo_mobil_portfolio/theme/Colors.dart';
import 'package:naldo_mobil_portfolio/theme/Styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailView extends StatelessWidget {
  final Project project;
  DetailView({@required this.project});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AudiColors.grey,
      appBar: AppBar(
        title: Text(
          project.title,
          style: AudiStyles.largeTextLighter,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            color: AudiColors.amber,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: project.id,
              child: Image.asset(project.urlImg),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        project.title,
                        style: AudiStyles.largeTextLighter,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        project.description,
                        style: AudiStyles.normalTextLighter,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      buildStackLive(context),
                      SizedBox(
                        height: 15,
                      ),
                      buildStacksChips(),
                      SizedBox(
                        height: 20,
                      ),
                      buildGitBtn(context),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        (project.images == null) || (project.images.length == 0)
                            ? AppLocalizations.of(context)
                                .translate('detail_caps_0')
                            : AppLocalizations.of(context)
                                .translate('detail_caps'),
                        style: AudiStyles.normalTextLighter,
                      ),
                    ],
                  ),
                ),
                (project.images == null) || (project.images.length == 0)
                    ? Container()
                    : buildCaps(),
              ],
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  Container buildCaps() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [AudiColors.grey, Colors.blueGrey],
      )),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: project.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AudiColors.grey,
                      offset: Offset(10.0, 10.0),
                      blurRadius: 15.0,
                    )
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(project.images[index]))),
          );
        },
      ),
    );
  }

  SizedBox buildGitBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)
                  .translate('detail_link_github')
                  .toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2),
            ),
            SizedBox(
              width: 18,
            ),
            Icon(
              FontAwesomeIcons.github,
              color: Colors.black,
            ),
          ],
        ),
        color: AudiColors.amber,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: ()async {

          String url = project.gitUrl;
          if (await canLaunch(url)) {
          await launch(url);
          } else {
          throw 'Could not launch $url';
          }

        },
      ),
    );
  }

  Wrap buildStacksChips() {
    return Wrap(
      spacing: 8,
      children: project.tools.map((SoftwareTool tool) {
        return Chip(
          label: Text(tool.name),
          avatar: CircleAvatar(
            backgroundImage: AssetImage(tool.urlImg),
            backgroundColor: Colors.black,
          ),
        );
      }).toList(),
    );
  }

  Row buildStackLive(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          AppLocalizations.of(context).translate('detail_stack'),
          style: AudiStyles.largeTextLighter,
        ),
        OutlineButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: Row(
              children: <Widget>[
                Text(
                  AppLocalizations.of(context)
                      .translate('detail_live_view')
                      .toUpperCase(),
                  style: AudiStyles.smallTextLighter,
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  FontAwesomeIcons.eye,
                  size: 18,
                  color: project.onProject ? Colors.green : Colors.pink,
                )
              ],
            ))
      ],
    );
  }
}
