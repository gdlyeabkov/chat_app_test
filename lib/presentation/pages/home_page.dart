import 'package:chat_app_test/data/cubit/app_cubit.dart';
import 'package:chat_app_test/presentation/widgets/chat_detail_widget.dart';
import 'package:chat_app_test/presentation/widgets/chats_aside_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.appCubit,
    super.key,
  });

  final AppCubit appCubit;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: [
              ChatsAsideWidget(
                appCubit: widget.appCubit,
              ),
              widget.appCubit.state.selectedChat.id > -1
                  ? ChatDetailWidget(
                appCubit: widget.appCubit,
              )
                  : Container(
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width / 100 * 34.6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Выберите чат,\nчтобы начать общаться',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
