import 'package:message_sender_polymorphism/message_sender_polymorphism.dart'
    as message_sender_polymorphism;
import 'package:message_sender_polymorphism/message_sender_polymorphism.dart';

// client code
void main(List<String> arguments) {
  final voiceMessageJson = {
    'type': 'voice',
    'duration': '1:00',
    'sendAt': '2021-01-01'
  };
  final locationMessageJson = {
    'type': 'location',
    'sendAt': '2021-01-01',
    'latitude': 30.0,
    'longitude': 32.0,
  };

  final message = MessageFactory.fromJson(voiceMessageJson);
  final message2 = MessageFactory.fromJson(locationMessageJson);
  print(message is VoiceMessage);
  print(message is LocationMessage);


  message.send();
  message2.send();
}

void v2() {}
