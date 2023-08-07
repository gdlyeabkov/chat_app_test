part of 'app_cubit.dart';

final class AppState {
  final List<Chat> chats;
  final Chat selectedChat;
  final Timer? timer;

  const AppState({
    required this.chats,
    required this.selectedChat,
    required this.timer,
  });

  AppState copyWith({List<Chat>? chats, Chat? selectedChat, Timer? timer}) {
    return AppState(
      chats: chats ?? this.chats,
      selectedChat: selectedChat ?? this.selectedChat,
      timer: timer ?? this.timer,
    );
  }
}
