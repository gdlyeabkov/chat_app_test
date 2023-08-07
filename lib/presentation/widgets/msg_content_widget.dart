import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/widgets/msg_details_widget.dart';
import 'package:flutter/material.dart';

class MsgsItemContentWidget extends StatelessWidget {
  const MsgsItemContentWidget({
    required this.index,
    required this.appCubit,
    super.key,
  });

  final int index;
  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 15,
            right: 93,
            top: 15,
            bottom: 15,
          ),
          child: Text(
            appCubit.state.selectedChat.msgs[index].content,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
        ),
        MsgsItemDetailsWidget(
          index: index,
          appCubit: appCubit,
        ),
      ],
    );
  }
}
