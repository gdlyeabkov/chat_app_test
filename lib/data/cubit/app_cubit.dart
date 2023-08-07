import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:chat_app_test/data/constants/hosts.dart';
import 'package:chat_app_test/data/constants/patterns.dart';
import 'package:chat_app_test/data/models/chat.dart';
import 'package:chat_app_test/data/models/msg.dart';
import 'package:chat_app_test/data/models/serialization.dart';
import 'package:chat_app_test/data/utils/mocks.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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

  selectChat(id) {
    var chat = state.chats.where((element) => element.id == id).first;
    emit(state.copyWith(
      selectedChat: chat,
    ));
    if (state.timer != null) state.timer?.cancel();
    List<String> values = [
      'income',
      'outcome',
    ];
    final timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      var random = new Random();
      var index = random.nextInt(values.length);
      String randomValue = values[index];
      random = new Random();
      var length = random.nextInt(50) + 1;
      var content = generateRandomContent(length);
      var now = new DateTime.now();
      var formatter = new DateFormat(Patterns.DATE_TIME_PATTERN);
      String formattedDate = formatter.format(now);
      addMsg(content, randomValue, formattedDate);
    });
    emit(
      state.copyWith(
        timer: timer,
      ),
    );
  }

  String generateRandomContent(length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Random rnd = new Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  sendMsg(String content) {
    var now = new DateTime.now();
    var formatter = new DateFormat(Patterns.DATE_TIME_PATTERN);
    String formattedDate = formatter.format(now);
    addMsg(content, 'outcome', formattedDate);
  }

  saveData() {
    Data data = Data(chats: state.chats);
    String jsonString = '';
    try {
      final jsonData = data.toJson();
      jsonString = jsonEncode(jsonData);
    } catch (e) {
      print('Error encoding data: $e');
    }
    final isHaveData = jsonString != null;
    if (isHaveData) {
      window.localStorage['data'] = jsonString;
    }
  }
}
