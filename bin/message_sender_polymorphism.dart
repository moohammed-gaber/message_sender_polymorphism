import 'package:message_sender_polymorphism/message_sender_polymorphism.dart'
    as message_sender_polymorphism;
import 'package:message_sender_polymorphism/message_sender_polymorphism.dart';

void main(List<String> arguments) {
  // v1();
  v2();
}

void v1() {
  final voiceMessageJson = {
    'type': 'voice',
    'duration': '1:00',
    'sendAt': '2021-01-01'
  };

  final locationMessageJson = {
    'latitude': 30.0,
    'longitude': 32.0,
  };

  final message = MessageFactory.fromJson(voiceMessageJson);
  final message2 = MessageFactory.fromJson(voiceMessageJson);
  late final MessageSender messageSender;
  if (message is VoiceMessage) {
    messageSender = VoiceMessageSender();
  }
  if (message is LocationMessage) {
    messageSender = LocationMessageSender();
  }
  messageSender.sendMessage(message);
}

void v2() {
  final voiceMessageJson = {
    'type': 'voice',
    'duration': '1:00',
    'sendAt': '2021-01-01'
  };
  final locationMessageJson = {
    'latitude': 30.0,
    'longitude': 32.0,
  };

  final message = MessageFactory.fromJson(voiceMessageJson);
  message.send();
}
