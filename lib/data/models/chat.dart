import 'package:chat_app_test/data/models/msg.dart';

final class Chat {
  final int id;
  final String title;
  final String subtitle;
  final String dateTime;
  final String photo;
  final String service;
  final bool isOpen;
  final List<Msg> msgs;

  const Chat({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.photo,
    required this.service,
    required this.isOpen,
    required this.msgs,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'subtitle': subtitle,
        'dateTime': dateTime,
        'photo': photo,
        'service': service,
        'isOpen': isOpen,
        'msgs': msgs.map((msg) => msg.toJson()).toList(),
      };

  factory Chat.fromJson(Map<dynamic, dynamic> json) {
    var msgJson = json['msgs'] as List;
    List<Msg> msgList = msgJson.map((i) => Msg.fromJson(i)).toList();
    return Chat(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      dateTime: json['dateTime'],
      photo: json['photo'],
      service: json['service'],
      isOpen: json['isOpen'],
      msgs: msgList,
    );
  }
}
