import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naldo_mobil_portfolio/localization/app_localizations.dart';
import 'package:naldo_mobil_portfolio/models/Project.dart';
import 'package:naldo_mobil_portfolio/theme/Styles.dart';
import 'package:naldo_mobil_portfolio/views/ProjectDetail.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectModal extends StatefulWidget {


  final Project project;
  ProjectModal({Key key, this.project}):super(key: key);

  @override
  _ProjectModalState createState() => _ProjectModalState();
}

class _ProjectModalState extends State<ProjectModal> {

   _launchURL(String gitUrl) async {
     String url = gitUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.times),
                  color: Colors.grey,
                  onPressed: () {},
                ),
                Text(
                  AppLocalizations.of(context).translate('modal_options'),
                  style: AudiStyles.normalTextLighter,
                )
              ],
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white12,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.github),
                    SizedBox(
                      width: 12,
                    ),
                    InkWell(
                      onTap:()async {

                        await _launchURL(widget.project.gitUrl);

                      },
                      child: Text(
                        AppLocalizations.of(context).translate('modal_link_github'),
                        style: AudiStyles.middleTitleLighter,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  AppLocalizations.of(context).translate('modal_link_github_description'),
                  style: AudiStyles.normalTextLighter,

                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailView(project: widget.project,))
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).translate('modal_link_details'),
                    style: AudiStyles.middleTitleLighter,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}