import 'dart:async';
import 'dart:convert';
import 'package:chat_app_test/data/constants/hosts.dart';
import 'package:chat_app_test/data/models/chat.dart';
import 'package:chat_app_test/data/utils/mocks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(
    AppState(
      chats: [],
      selectedChat: Chat(
        id: -1,
        title: '',
        subtitle: '',
        dateTime: '',
        photo: '',
        service: '',
        isOpen: true,
        msgs: [],
      ),
      timer: null,
    ),
  );

  init() async {
    emit(state.copyWith(
      chats: Mocks.chats,
    ));
    final dio = Dio();
    final response = await dio.get('${Hosts.API_DOMAIN}/posts');
    final status = response.statusCode;
    final isSuccessfull = status == 200;
    if (isSuccessfull) {
      String? data = window.localStorage['data'];
      if (data != null) {
        Map chatList = jsonDecode(data);
        Iterable rawChats = chatList['chats'];
        var val = rawChats.map<Chat>((e) {
          var someChat = Chat.fromJson(e);
          return someChat;
        }).toList();
        emit(state.copyWith(
          chats: val,
        ));
      }
    }
  }
}
