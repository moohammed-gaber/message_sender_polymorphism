import 'package:message_sender_polymorphism/messages.dart';
abstract class MessageSender<T extends Message> {
  Future<void> sendMessage(T message);
}

class VoiceMessageSender implements MessageSender<VoiceMessage> {
  @override
  Future<void> sendMessage(VoiceMessage message) async {
    final duration = message.duration;
    print('VoiceMessageSender sent a voice message with duration $duration');
  }
}

class TextMessageSender implements MessageSender<TextMessage> {
  @override
  Future<void> sendMessage(TextMessage message) async {
    final text = message.text;
    print('TextMessage sent a voice message with text $text');
  }
}

class LocationMessageSender implements MessageSender<LocationMessage> {
  @override
  Future<void> sendMessage(LocationMessage message) async {
    final longitude = message.longitude;
    final latitude = message.latitude;

    print(
        'LocationMessageSender sent a location message with longitude $longitude and latitude $latitude');
  }
}
