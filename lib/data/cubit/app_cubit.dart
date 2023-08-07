import 'dart:async';
import 'dart:convert';
import 'package:chat_app_test/data/constants/hosts.dart';
import 'package:chat_app_test/data/models/chat.dart';
import 'package:chat_app_test/data/models/msg.dart';
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


  void addMsg(String content, String type, String dateTime) {
    final selectedChat = state.selectedChat;
    final chat = Chat(
        id: selectedChat.id,
        title: selectedChat.title,
        subtitle: selectedChat.subtitle,
        dateTime: selectedChat.dateTime,
        photo: selectedChat.photo,
        service: selectedChat.service,
        isOpen: selectedChat.isOpen,
        msgs: [
          ...selectedChat.msgs,
          Msg(
            id: -1,
            content: content,
            type: type,
            dateTime: dateTime,
          ),
        ]);
    List<Chat> chats = [];
    for (Chat c in state.chats) {
      if (c.id == chat.id)
        chats = [
          ...chats,
          chat,
        ];
      else
        chats = [
          ...chats,
          c,
        ];
    }
    emit(state.copyWith(
      selectedChat: chat,
      chats: chats,
    ));
  }

  void toggleAccess() {
    final selectedChat = state.selectedChat;
    final selectedChatId = selectedChat.id;
    int index = state.chats.indexWhere((chat) {
      int chatId = chat.id;
      final isSelectedChat = chatId == selectedChatId;
      return isSelectedChat;
    });
    var val = !selectedChat.isOpen;
    state.chats[index] = Chat(
      id: selectedChat.id,
      title: selectedChat.title,
      subtitle: selectedChat.subtitle,
      dateTime: selectedChat.dateTime,
      photo: selectedChat.photo,
      service: selectedChat.service,
      isOpen: val,
      msgs: selectedChat.msgs,);
    emit(
      state.copyWith(
        selectedChat: state.chats[index],
      ),
    );
  }
}
