import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:naldo_mobil_portfolio/common/ChatMessage.dart';
import 'package:naldo_mobil_portfolio/localization/app_localizations.dart';
import 'package:naldo_mobil_portfolio/theme/Colors.dart';
import 'package:naldo_mobil_portfolio/theme/Styles.dart';

class MessageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AudiColors.grey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              color: AudiColors.amber,
            ),
          ),
          actions: <Widget>[
            buildAppBarAvatar(),
          ],
        ),
        body: ChatScreen());
  }

  Stack buildAppBarAvatar() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 6, 14, 0),
          child: SizedBox(
            width: 44,
            height: 44,
            child: Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me.jpg'),
                ),
                width: 32.0,
                height: 32.0,
                padding: const EdgeInsets.all(2), // borde width
                decoration: BoxDecoration(
                  color: AudiColors.amber, // border color
                  shape: BoxShape.circle,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 34, 0, 0),
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.lightGreenAccent, // border color
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void _handleSubmit(String text) {
    _chatController.clear();

    var currentTime = new DateTime.now();
    String time = currentTime.toString().substring(11,16);
    ChatMessage message = new ChatMessage(text: text, time:time);
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _chatEnvironment() {
    return IconTheme(
      data: IconThemeData(color: AudiColors.amber),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: AppLocalizations.of(context)
                        .translate('chat_placeholder')),
                controller: _chatController,
                style: AudiStyles.normalTextLighter,
                onSubmitted: _handleSubmit,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(FontAwesomeIcons.solidPaperPlane),
                onPressed: () => _handleSubmit(_chatController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(
          height: 1.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: AudiColors.greyLighter,
          ),
          child: _chatEnvironment(),
        )
      ],
    );
  }
}
