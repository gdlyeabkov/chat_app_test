import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatSendFormWidget extends StatefulWidget {
  const ChatSendFormWidget({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  State<StatefulWidget> createState() => _ChatSendFormWidgetState();
}

class _ChatSendFormWidgetState extends State<ChatSendFormWidget> {
  var inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 54,
        right: 55,
        top: 18,
        bottom: 18,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(
              color: Color.fromRGBO(0, 0, 0, 0.11),
              width: 1,
            ),
          )),
      height: 88,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 13,
            ),
            child: Icon(
              Icons.add_circle_outline,
            ),
          ),
          Expanded(
            child: TextField(
              onSubmitted: (val) {
                widget.appCubit.sendMsg(inputController.text);
                setState(() {
                  inputController.text = '';
                });
              },
              controller: inputController,
              style: TextField.materialMisspelledTextStyle,
              decoration: new InputDecoration(
                suffixIcon: Icon(
                  Icons.emoji_emotions_outlined,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.11), width: 1),
                  borderRadius: BorderRadius.circular(35),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.11), width: 1),
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: 'Начни писать что-нибудь...',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 22,
            ),
            child: Icon(
              Icons.mic_none_outlined,
            ),
          )
        ],
      ),
    );
  }
}
