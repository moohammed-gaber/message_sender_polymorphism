import 'package:message_sender_polymorphism/messages.dart';
import 'package:message_sender_polymorphism/senders.dart';

class MessageFactory {
  static Message fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    switch (type) {
      case 'voice':
        return VoiceMessage.fromJson(json);
      case 'location':
        return LocationMessage.fromJson(json);
      case 'text':
        return TextMessage.fromJson(json);

      default:
        throw Exception('Unknown message type');
    }
  }
}
