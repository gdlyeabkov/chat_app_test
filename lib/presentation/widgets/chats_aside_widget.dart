import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/widgets/chat_widget.dart';
import 'package:flutter/material.dart';

class ChatsAsideWidget extends StatelessWidget {
  const ChatsAsideWidget({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width / 100 * 34.6,
      child: ListView.builder(
        clipBehavior: Clip.antiAlias,
        itemBuilder: (BuildContext context, int index) {
          return ChatWidget(
            chat: appCubit.state.chats[index],
            appCubit: appCubit,
          );
        },
        itemCount: appCubit.state.chats.length,
      ),
    );
  }
}
