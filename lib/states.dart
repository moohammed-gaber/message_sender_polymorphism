import 'package:message_sender_polymorphism/messages.dart';
import 'package:message_sender_polymorphism/senders.dart';

class MessageContext {
  MessageContext() {
    messageState = MessageIdleState();
  }
  void setState(MessageState state) {
    messageState = state;
  }

  late MessageState messageState;
}

abstract class MessageState {}

class MessageSendingState extends MessageState {
  @override
  String toString() {
    return 'MessageSendingState';
  }
}

class MessageIdleState extends MessageState {}

class MessageSentState extends MessageState {}
