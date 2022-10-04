import 'package:message_sender_polymorphism/messages.dart';

abstract class MessageSender<T extends Message> {
  Future<void> sendMessage(T message);
}

Future doIoTask() {
  return Future.delayed(Duration(seconds: 4));
}

class VoiceMessageSender implements MessageSender<VoiceMessage> {
  @override
  Future<void> sendMessage(VoiceMessage message) async {
    print('Sending voice message');
    await doIoTask();

    final duration = message.duration;
    print('VoiceMessageSender sent a voice message with duration $duration');
  }
}

class TextMessageSender implements MessageSender<TextMessage> {
  @override
  Future<void> sendMessage(TextMessage message) async {
    print('Sending text message');
    await doIoTask();

    final text = message.text;
    print('TextMessage sent a voice message with text $text');
  }
}

class LocationMessageSender implements MessageSender<LocationMessage> {
  @override
  Future<void> sendMessage(LocationMessage message) async {
    print('Sending location message');

    await doIoTask();

    final longitude = message.longitude;
    final latitude = message.latitude;

    print(
        'LocationMessageSender sent a location message with longitude $longitude and latitude $latitude');
  }
}
