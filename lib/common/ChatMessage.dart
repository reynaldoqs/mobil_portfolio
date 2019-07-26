import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:naldo_mobil_portfolio/theme/Colors.dart';
import 'package:naldo_mobil_portfolio/theme/Styles.dart';

const String _name = "Reynaldo";

class ChatMessage extends StatelessWidget {
  final String text;
  final String time;

  ChatMessage({this.text,this.time});

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AudiColors.greyLighter),
              padding: const EdgeInsets.fromLTRB(8, 4, 12, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(_name, style: AudiStyles.smallTextLighter),
                      SizedBox(
                        width: 16,
                      ),
                      Text(time,style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12
                      ),),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      text,
                      style: AudiStyles.normalTextLighter,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
