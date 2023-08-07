import 'dart:async';
import 'package:chat_app_test/data/models/chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
