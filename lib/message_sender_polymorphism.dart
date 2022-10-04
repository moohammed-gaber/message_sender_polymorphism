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

class LocationMessageSender implements MessageSender<LocationMessage> {
  @override
  Future<void> sendMessage(LocationMessage message) async {
    final longitude = message.longitude;
    final latitude = message.latitude;

    print(
        'LocationMessageSender sent a location message with longitude $longitude and latitude $latitude');
  }
}

abstract class Message {
  Message(this.sendAt);

  final DateTime sendAt;

  Message.fromJson(Map<String, dynamic> json)
      : sendAt = DateTime.parse(json['sendAt']);

  Future<void> send();
}

class VoiceMessage extends Message {
  VoiceMessage(this.duration, DateTime sendAt) : super(sendAt);

  final String duration;

  VoiceMessage.fromJson(Map<String, dynamic> json)
      : duration = json['duration'],
        super.fromJson(json);

  @override
  Future<void> send() {
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
