import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class ChatDetailHeaderMenuWidget extends StatefulWidget {
  const ChatDetailHeaderMenuWidget({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  State<ChatDetailHeaderMenuWidget> createState() =>
      _ChatDetailHeaderMenuWidgetState();
}

class _ChatDetailHeaderMenuWidgetState
    extends State<ChatDetailHeaderMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: widget.appCubit.state.selectedChat.isOpen,
          trackColor: MaterialStateProperty.all<Color>(
            widget.appCubit.state.selectedChat.isOpen
                ? Color(0xFF1CB355)
                : Color.fromRGBO(0, 0, 0, 0.11),
          ),
          thumbColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          onChanged: (val) {
            widget.appCubit.toggleAccess();
          },
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 9,
          ),
          child: Text(
            widget.appCubit.state.selectedChat.isOpen ? 'Открыт' : 'Закрыт',
            style: TextStyle(
              color: widget.appCubit.state.selectedChat.isOpen
                  ? Color(0xFF1CB355)
                  : Color(0xFFFF0000),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 7,
          ),
          child: CircleAvatar(
            child: Image.asset(
              'assets/images/avatar.png',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 33,
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ),
                  side: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(
                  62,
                  62,
                ),
              ),
              fixedSize: MaterialStateProperty.all<Size>(
                Size(
                  62,
                  62,
                ),
              ),
              maximumSize: MaterialStateProperty.all<Size>(
                Size(
                  62,
                  62,
                ),
              ),
              backgroundColor:
              MaterialStateProperty.all<Color>(Color(0xFFE8ECF3)),
            ),
            child: Icon(
              Icons.more_vert,
            ),
          ),
        ),
      ],
    );
  }
}
