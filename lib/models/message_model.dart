import 'package:chat/models/user_model.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message(this.sender, this.time, this.text, this.isLiked, this.unread);
}

final User currentUser = User(0, 'Current User', 'assets/images/image10.jpg');
final User trevor = User(1, 'Kachoma', 'assets/images/image9.jpg');
final User macd = User(2, 'Macd', 'assets/images/image4.jpg');
final User virusi = User(3, 'Virusi', 'assets/images/image7.jpg');
final User onyi = User(4, 'Onyi', 'assets/images/image6.jpg');
final User ivy = User(5, 'Ivy', 'assets/images/image2.jpg');
final User sheilah = User(6, 'Sheilah', 'assets/images/image3.jpg');
final User jane = User(7, 'Jane', 'assets/images/image1.jpg');
final User cat = User(8, 'Cat', 'assets/images/image8.jpg');
final User chrome = User(9, 'Chrome', 'assets/images/image5.jpg');

List<User> favourites = [ivy, jane, macd, virusi, onyi];

List<Message> chats = [
  Message(ivy, '8:00 PM', 'Sasa Lemi💗💗💗. Uko aje?', false, false),
  Message(trevor, '6:00 PM', 'Iyo account iko aje?', true, true),
  Message(macd, '5:00 PM', 'Uliona aje uyo dame?', false, false),
  Message(cat, '4:45 PM', 'You got time?😂😂😂', false, false),
  Message(virusi, '4:30 PM', 'Si tufike park leo🍻🍻🍻', true, true),
  Message(chrome, '2:00 PM', 'Kuja ufungue pool leo. Leo lazima nijiredeem.',
      false, false),
];

List<Message> messages = [
  Message(currentUser, '4:45 PM', 'You got time?😂😂😂', false, true),
  Message(cat, '3:45 PM', 'Why?🤔🤔🤔🤔🤔', false, true),
  Message(currentUser, '3:30 PM',
      'Oh, sorry, had to do something. As a human, it\'s awful.', false, true),
  Message(cat, '3:00 PM', 'You disappeared...', false, true),
  Message(
      cat,
      '12:00 PM',
      'All good here, free everything, just chasing the string😂😂😂😂. How\'s being Human?',
      true,
      true),
  Message(currentUser, '11:46 AM', 'How\'s life as a cat😺😺😺😺', false, true),
  Message(cat, '11:30 AM', 'Holla..', false, true),
  Message(currentUser, '11:25 AM', 'Hey Cat...it\'s been a while', false, true),
  Message(cat, '9:00 PM', 'Have a human night', true, true)
];
