import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageState {
  final List<Map<String, String>> messages;

  MessageState(this.messages);
}

final messageProvider = StateNotifierProvider<MessageNotifier, MessageState>((ref) {
  return MessageNotifier(MessageState([]));
});

class MessageNotifier extends StateNotifier<MessageState> {
  MessageNotifier(MessageState state) : super(state);

  void addMessage(Map<String, String> message) {
    state = MessageState([...state.messages, message]);
  }
}
