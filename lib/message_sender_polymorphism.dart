// abstract class SendMessageFailure {}

abstract class MessageSender<T extends Message> {
  Future<void> sendMessage(T message);
}

Future<void> ioTask() => Future.delayed(Duration(seconds: 5));

class VoiceMessageSender implements MessageSender<VoiceMessage> {
  @override
  Future<void> sendMessage(VoiceMessage message) async {
    print('VoiceMessageSender Start');

    final duration = message.duration;
    await ioTask();
    print('VoiceMessageSender end');
  }
}

class LocationMessageSender implements MessageSender<LocationMessage> {
  @override
  Future<void> sendMessage(LocationMessage message) async {
    print('LocationMessageSender end');

    final longitude = message.longitude;
    await ioTask();
    print('LocationMessageSender start');
  }
}

abstract class Message<T> {
  final DateTime sendAt;

  Message(this.sendAt);
  Message.fromJson(Map<String, dynamic> json)
      : sendAt = DateTime.parse(json['sendAt']);
  Future<void> send();
}

class VoiceMessage extends Message<VoiceMessage> {
  final String duration;

  VoiceMessage(this.duration, DateTime sendAt) : super(sendAt);
  VoiceMessage.fromJson(Map<String, dynamic> json)
      : duration = json['duration'],
        super.fromJson(json);

  @override
  Future<void> send() {
    return VoiceMessageSender().sendMessage(this);
  }
}

class LocationMessage extends Message<LocationMessage> {
  final double latitude;
  final double longitude;

  LocationMessage(this.latitude, this.longitude, DateTime sendAt)
      : super(sendAt);
  LocationMessage.fromJson(Map<String, dynamic> json)
      : latitude = json['latitude'],
        longitude = json['longitude'],
        super.fromJson(json);

  @override
  Future<void> send() {
    return LocationMessageSender().sendMessage(this);
  }
}

class MessageFactory {
  static Message fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    switch (type) {
      case 'voice':
        return VoiceMessage.fromJson(json);
      case 'location':
        return LocationMessage.fromJson(json);
      default:
        throw Exception('Unknown message type');
    }
  }
}
