import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naldo_mobil_portfolio/common/FadePageRoute.dart';
import 'package:naldo_mobil_portfolio/theme/Colors.dart';
import 'package:naldo_mobil_portfolio/theme/Styles.dart';
import 'package:naldo_mobil_portfolio/views/ProjectDetail.dart';
import 'package:rounded_modal/rounded_modal.dart';
import 'package:naldo_mobil_portfolio/common/ProjectModal.dart';
import 'package:naldo_mobil_portfolio/models/Project.dart';


class ProjectCard extends StatelessWidget {
  final Project project;
  ProjectCard({@required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: (){
                assert(project.runtimeType == Project);
                Navigator.of(context).push(
                  FadePageRoute(
                    widget: DetailView(project: project,),
                  ),
                );
                /*Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                  return DetailView(project: project,);
                }),);*/
              },
              child: Hero(
                tag: project.id,
                child: Container(
                  height: project.imgHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage(
                        project.urlImg,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    project.title,
                    style: AudiStyles.smallTextLighter,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    showRoundedModalBottomSheet(
                      context: context,
                      radius: 10.0, // This is the default
                      color: AudiColors.greyLighter, // Also default
                      builder: (context) => ProjectModal(project:project)
                    );
                  },
                  child: Container(
                      height: 24,
                      width: 34,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.0))),
                      child: Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                      )),
                )
              ],
            ),
          ],
        ));
  }
}
