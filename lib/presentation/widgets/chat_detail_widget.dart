import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/widgets/chat_detail_header_widget.dart';
import 'package:chat_app_test/presentation/widgets/chat_send_form_widget.dart';
import 'package:chat_app_test/presentation/widgets/msg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailWidget extends StatefulWidget {
  const ChatDetailWidget({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  State<StatefulWidget> createState() => _ChatDetailWidgetState();
}

class _ChatDetailWidgetState extends State<ChatDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -
          (MediaQuery.of(context).size.width / 100 * 34.6),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 88,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/background.png'))),
            child: Expanded(
              child: Column(
                children: [
                  ChatDetailHeaderWidget(appCubit: widget.appCubit),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.11),
                              width: 1,
                            ),
                            top: BorderSide(
                              color: Color.fromRGBO(0, 0, 0, 0.11),
                              width: 1,
                            ),
                          )),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount:
                        widget.appCubit.state.selectedChat.msgs.length,
                        itemBuilder: (BuildContext context, int index) =>
                            MsgWidget(
                              index: index,
                              appCubit: widget.appCubit,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ChatSendFormWidget(
            appCubit: widget.appCubit,
          ),
        ],
      ),
    );
  }
}
