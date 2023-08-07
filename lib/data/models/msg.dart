final class Msg {
  final int id;
  final String content;
  final String type;
  final String dateTime;

  const Msg({
    required this.id,
    required this.content,
    required this.type,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'type': type,
        'dateTime': dateTime,
      };

  factory Msg.fromJson(Map<String, dynamic> json) {
    return Msg(
      id: json['id'],
      content: json['content'],
      type: json['type'],
      dateTime: json['dateTime'],
    );
  }
}
