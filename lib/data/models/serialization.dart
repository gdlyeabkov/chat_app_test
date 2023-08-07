import 'package:chat_app_test/data/models/chat.dart';

class Data {
  final List<Chat> chats;

  Data({required this.chats,});

  Map<String, dynamic> toJson() => {
    'chats': chats.map((chat) => chat.toJson()).toList(),
  };
}
