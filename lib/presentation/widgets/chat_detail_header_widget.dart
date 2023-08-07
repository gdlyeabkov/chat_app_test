import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/widgets/chat_detail_header_aside_widget.dart';
import 'package:chat_app_test/presentation/widgets/chat_detail_header_menu_widget.dart';
import 'package:flutter/material.dart';

class ChatDetailHeaderWidget extends StatefulWidget {
  const ChatDetailHeaderWidget({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  State<ChatDetailHeaderWidget> createState() => _ChatDetailHeaderWidgetState();
}

class _ChatDetailHeaderWidgetState extends State<ChatDetailHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.6),
      ),
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChatDetailHeaderAsideWidget(appCubit: widget.appCubit),
          ChatDetailHeaderMenuWidget(appCubit: widget.appCubit),
        ],
      ),
    );
  }
}
