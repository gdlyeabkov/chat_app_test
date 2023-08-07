import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/widgets/msg_content_widget.dart';
import 'package:flutter/material.dart';

class MsgWidget extends StatelessWidget {
  const MsgWidget({
    required this.index,
    required this.appCubit,
    super.key,
  });

  final int index;
  final AppCubit appCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
            10,
          ),
          child: index > 0 &&
                  appCubit.state.selectedChat.msgs[index].dateTime
                          .split('/')[0] !=
                      appCubit.state.selectedChat.msgs[index - 1].dateTime
                          .split('/')[0]
              ? Container(
                  width: 152,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.11,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(
                      23,
                    ),
                  ),
                  child: Align(
                    child: Text(
                      appCubit.state.selectedChat.msgs[index].dateTime
                          .split('/')[0],
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ),
        Row(
          mainAxisAlignment:
              appCubit.state.selectedChat.msgs[index].type == 'income'
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 53,
                ),
                child: Container(
                  width: 436,
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 39,
                  ),
                  decoration: BoxDecoration(
                    color:
                        appCubit.state.selectedChat.msgs[index].type == 'income'
                            ? Color(0xFFE8ECF3)
                            : Color(0xFFB4E4FF),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        30,
                      ),
                      topRight: Radius.circular(
                        30,
                      ),
                      bottomLeft:
                          appCubit.state.selectedChat.msgs[index].type ==
                                  'income'
                              ? Radius.circular(
                                  0,
                                )
                              : Radius.circular(
                                  30,
                                ),
                      bottomRight:
                          appCubit.state.selectedChat.msgs[index].type ==
                                  'outcome'
                              ? Radius.circular(
                                  0,
                                )
                              : Radius.circular(
                                  30,
                                ),
                    ),
                  ),
                  child: MsgsItemContentWidget(
                    index: index,
                    appCubit: appCubit,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
