import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/data/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    required this.chat,
    required this.appCubit,
    super.key});

  final Chat chat;
  final AppCubit appCubit;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.appCubit.selectChat(widget.chat.id,),
      child: Container(
        padding: EdgeInsets.only(
          left: 28.25,
          right: 14.75,
          top: 12,
          bottom: 7,
        ),
        height: 89,
        decoration: BoxDecoration(
          color: widget.chat.id == widget.appCubit.state.selectedChat.id ? Color(0xFFE8ECF3) : Colors.white,
        ),
        child: ClipRect(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    widget.chat.photo,
                    errorBuilder: (context, e, st) {
                      return Image.asset('assets/images/andrey_muratov.png');
                    },
                  ),
                  Positioned(
                    right: -6,
                    bottom: -5,
                    child: SvgPicture.asset(
                      widget.chat.service,
                      width: 27,
                      height: 27,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.chat.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 5,
                        ),
                        child: Row(
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 300,
                                maxHeight: 17,
                              ),
                              child: Text(
                                widget.chat.msgs.last.content.length > 40
                                    ? '${widget.chat.msgs.last.content.substring(0, 40)}...'
                                    : widget.chat.msgs.last.content,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(widget.chat.msgs.last.dateTime.split('/')[1]),
            ],
          ),
        ),
      ),
    );
  }
}
