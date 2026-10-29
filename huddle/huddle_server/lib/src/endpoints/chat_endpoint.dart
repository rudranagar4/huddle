import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class ChatEndpoint extends Endpoint {
  static final List<ChatMessage> _messages = [
    ChatMessage(
      id: 1,
      senderId: 4,
      receiverId: 1,
      message: 'Hey Alex! Glad we matched on HUDDLE. When do you want to start DSA review?',
      sentAt: DateTime.now().subtract(const Duration(hours: 5)),
      isRead: true,
    ),
    ChatMessage(
      id: 2,
      senderId: 1,
      receiverId: 4,
      message: 'Hey Maya! Tonight after 8 PM works great for me. We can do tree traversals.',
      sentAt: DateTime.now().subtract(const Duration(hours: 4, minutes: 45)),
      isRead: true,
    ),
    ChatMessage(
      id: 3,
      senderId: 4,
      receiverId: 1,
      message: 'Awesome, see you then on Discord/Meet!',
      sentAt: DateTime.now().subtract(const Duration(hours: 4, minutes: 30)),
      isRead: true,
    ),
  ];

  Future<List<ChatMessage>> getConversation(
    Session session,
    int student1Id,
    int student2Id,
  ) async {
    return _messages.where((m) {
      return (m.senderId == student1Id && m.receiverId == student2Id) ||
          (m.senderId == student2Id && m.receiverId == student1Id);
    }).toList();
  }

  Future<ChatMessage> sendMessage(
    Session session,
    int senderId,
    int receiverId,
    String message,
  ) async {
    final msg = ChatMessage(
      id: _messages.length + 1,
      senderId: senderId,
      receiverId: receiverId,
      message: message,
      sentAt: DateTime.now(),
      isRead: false,
    );
    _messages.add(msg);
    return msg;
  }
}
