import 'package:message_sender_polymorphism/states.dart';
import 'package:message_sender_polymorphism/senders.dart';

abstract class Message {
  final MessageContext context = MessageContext();

  Message(this.sendAt);

  final DateTime sendAt;

  Message.fromJson(Map<String, dynamic> json)
      : sendAt = DateTime.parse(json['sendAt']);
  Future<void> send();

  Future<void> execute() async {
/*
    if(context.)
*/
    context.setState(MessageSendingState());
    await send();
    context.setState(MessageSentState());
  }
}

class TextMessage extends Message {
  TextMessage(this.text, DateTime sendAt) : super(sendAt);

  final String text;
  TextMessage.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        super.fromJson(json);

  @override
  Future<void> send() async {
    return TextMessageSender().sendMessage(this);
  }
}

class VoiceMessage extends Message {
  VoiceMessage(this.duration, DateTime sendAt) : super(sendAt);

  final String duration;

  VoiceMessage.fromJson(Map<String, dynamic> json)
      : duration = json['duration'],
        super.fromJson(json);

  @override
  Future<void> send() async {
    return VoiceMessageSender().sendMessage(this);
  }
}

class LocationMessage extends Message {
  final double latitude;
  final double longitude;

  LocationMessage(this.latitude, this.longitude, DateTime sendAt)
      : super(sendAt);
  LocationMessage.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'],
        super.fromJson(json);

  @override
  Future<void> send() async {
    return LocationMessageSender().sendMessage(this);
  }
}
