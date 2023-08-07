import 'package:chat_app_test/data/models/chat.dart';
import 'package:chat_app_test/data/models/msg.dart';

abstract final class Mocks {
  static const chats = [
    Chat(
      id: 1,
      title: 'Софья Макарова',
      subtitle: 'Привет! Мне нужно 4001 роза, у моего подруги',
      dateTime: ' 13:05',
      photo: 'assets/images/sofia_makarova.png',
      service: 'assets/vector/whats_app.svg',
      isOpen: true,
      msgs: [
        Msg(
          id: 1,
          content: 'Debug',
          type: 'income',
          dateTime: '27 Jun/13:05',
        ),
        Msg(
          id: 2,
          content: 'Debug 2',
          type: 'outcome',
          dateTime: '27 Jun/13:05',
        ),
      ],
    ),
    Chat(
      id: 2,
      title: 'Андрей Муратов',
      subtitle: 'Добрый день, у вас есть 43 US такие?',
      dateTime: '13:05',
      photo: 'assets/images/andrey_muratov.png',
      service: 'assets/vector/whats_app.svg',
      isOpen: true,
      msgs: [
        Msg(
          id: 1,
          content: 'Debug',
          type: 'income',
          dateTime: '27 Jun/13:05',
        ),
      ],
    ),
    Chat(
      id: 3,
      title: 'Кишлак Ахбекаев',
      subtitle: 'Привет! Мне нужно 4001 роза, у моей подруги',
      dateTime: '13:05',
      photo: 'assets/images/kishlack_ahbekaev.png',
      service: 'assets/vector/vk.svg',
      isOpen: true,
      msgs: [
        Msg(
          id: 1,
          content: 'Debug',
          type: 'income',
          dateTime: '27 Jun/13:05',
        ),
      ],
    ),
    Chat(
      id: 4,
      title: 'Олеся Клунская',
      subtitle: 'Привет! Мне нужно 4001 роза, у моей подружки',
      dateTime: '13:05',
      photo: 'assets/images/olesya_klunskaya.png',
      service: 'assets/vector/vk.svg',
      isOpen: true,
      msgs: [
        Msg(
          id: 1,
          content: 'Debug',
          type: 'income',
          dateTime: '27 Jun/13:05',
        ),
      ],
    ),
    Chat(
      id: 5,
      title: 'Эдгар Фаев',
      subtitle: 'Диалог закрыт',
      dateTime: '13:05',
      photo: 'assets/images/edgar_faev.png',
      service: 'assets/vector/whats_app.svg',
      isOpen: true,
      msgs: [
        Msg(
          id: 1,
          content: 'Debug',
          type: 'income',
          dateTime: '27 Jun/13:05',
        ),
      ],
    ),
    Chat(
      id: 6,
      title: 'Кристина Ганова',
      subtitle: 'Привет! Мне нужно 4001 роза, у моей подружки',
      dateTime: '13:05',
      photo: 'assets/images/christina_ganova.png',
      service: 'assets/vector/avito.svg',
      isOpen: true,
      msgs: [
        Msg(
          id: 1,
          content: 'Debug',
          type: 'income',
          dateTime: '27 Jun/13:05',
        ),
      ],
    ),
  ];
}
