import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MsgsItemDetailsWidget extends StatelessWidget {
  const MsgsItemDetailsWidget({
    required this.index,
    required this.appCubit,
    super.key,
  });

  final int index;
  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 11.34,
      bottom: 7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            appCubit.state.selectedChat.msgs[index].dateTime
                .split('/')[1],
            style: TextStyle(),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 6,
            ),
            child: SvgPicture.asset(
              'assets/vector/double_check.svg',
            ),
          ),
        ],
      ),
    );
  }
}
