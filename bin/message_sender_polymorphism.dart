import 'package:message_sender_polymorphism/factory.dart';
import 'package:message_sender_polymorphism/states.dart'
    as message_sender_polymorphism;
import 'package:message_sender_polymorphism/states.dart';
import 'package:message_sender_polymorphism/messages.dart';

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

  final textMessageJson = {
    'type': 'text',
    'sendAt': '2021-01-01',
    'text': 'fdfdsfdsfds',
  };

  final message = MessageFactory.fromJson(voiceMessageJson);
  final message2 = MessageFactory.fromJson(locationMessageJson);
  final message3 = MessageFactory.fromJson(textMessageJson);
  print(message is VoiceMessage);
  print(message is LocationMessage);

  message.send();
  message2.send();
  message3.send();
  // message2.context.;
}

void v2() {}
