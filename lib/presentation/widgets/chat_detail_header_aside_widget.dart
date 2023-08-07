import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class ChatDetailHeaderAsideWidget extends StatefulWidget {
  const ChatDetailHeaderAsideWidget({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  State<ChatDetailHeaderAsideWidget> createState() =>
      _ChatDetailHeaderAsideWidgetState();
}

class _ChatDetailHeaderAsideWidgetState
    extends State<ChatDetailHeaderAsideWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE8ECF3),
      child: Container(
        padding: EdgeInsets.only(
          left: 9,
          right: 18,
          top: 9,
          bottom: 9,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.appCubit.state.selectedChat.photo,
              width: 42,
              height: 42,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 17,
                right: 43,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.appCubit.state.selectedChat.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Text(
                    widget.appCubit.state.selectedChat.subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
            ),
          ],
        ),
      ),
    );
  }
}
