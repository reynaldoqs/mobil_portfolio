import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naldo_mobil_portfolio/common/FadePageRoute.dart';
import 'package:naldo_mobil_portfolio/theme/Colors.dart';
import 'package:naldo_mobil_portfolio/common/ProjectCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naldo_mobil_portfolio/models/Project.dart';
import 'package:naldo_mobil_portfolio/views/privateMessage.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AudiColors.grey,
            AudiColors.grey,
            Colors.blueGrey,
          ],
          //   stops: [0.0, 0.2, 1.0],
        ),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            centerTitle: true,
            title: Hero(
              tag: 'RLogo',
              child: Image.asset(
                'assets/images/logoW.png',
                width: 30,
              ),
            ),
            backgroundColor: AudiColors.greyLighter,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.commentDots,
                  color: AudiColors.amber,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute(
                      widget: MessageView(),
                    ),
                  );
                },
              )
            ],
            leading: IconButton(
              icon: Icon(
                FontAwesomeIcons.bars,
                color: AudiColors.amber,
              ),
              onPressed: () {},
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            sliver: SliverStaggeredGrid.countBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              itemCount: myProject.length,
              staggeredTileBuilder: (_) => StaggeredTile.fit(1),
              itemBuilder: (context, index) => ProjectCard(project: myProject[index],),
            ),
          )
        ],
      ),
    ));
  }
}
