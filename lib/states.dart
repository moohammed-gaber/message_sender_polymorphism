import 'package:message_sender_polymorphism/messages.dart';
import 'package:message_sender_polymorphism/senders.dart';

class MessageContext {
  MessageContext() {
    messageState = MessageSendingState();
  }

  late MessageState messageState;
// set state
  void setState(MessageState state) {
    messageState = state;
  }
}

abstract class MessageState {}

class MessageSendingState extends MessageState {


}

class MessageSentState extends MessageState {}
