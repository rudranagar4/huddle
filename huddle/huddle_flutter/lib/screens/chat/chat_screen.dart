import 'package:flutter/material.dart';
import 'package:huddle_client/huddle_client.dart';
import 'package:intl/intl.dart';
import '../../core/services/huddle_service.dart';
import '../../core/theme/app_colors.dart';

class ChatScreen extends StatefulWidget {
  final Student buddy;

  const ChatScreen({super.key, required this.buddy});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _msgController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<ChatMessage> _messages = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    final list = await HuddleService.instance.getMessages(widget.buddy.id ?? 2);
    if (!mounted) return;
    setState(() {
      _messages = list;
      _isLoading = false;
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 60,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _msgController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage([String? quickText]) async {
    final text = quickText ?? _msgController.text.trim();
    if (text.isEmpty) return;

    _msgController.clear();
    final newMsg = await HuddleService.instance.sendMessage(widget.buddy.id ?? 2, text);
    setState(() {
      _messages.add(newMsg);
    });
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    final currentStudentId = HuddleService.instance.currentStudent.id ?? 1;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navyBackgroundDark : AppColors.glassBgPure,
      appBar: AppBar(
        backgroundColor: isDark ? AppColors.navySurfaceDark.withAlpha(200) : Colors.white.withAlpha(200),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 18, color: isDark ? AppColors.textWhite : AppColors.textDarkHeading),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                widget.buddy.avatarUrl ?? 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.buddy.fullName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.tealSuccess,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'Active Now',
                        style: TextStyle(color: AppColors.tealSuccess, fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark ? null : AppColors.glassBackgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Chat messages list
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator(color: AppColors.cyanBrand))
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final msg = _messages[index];
                          final isMe = msg.senderId == currentStudentId;

                          return Align(
                            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width * 0.75,
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                gradient: isMe ? AppColors.cyanActionGradient : null,
                                color: isMe
                                    ? null
                                    : (isDark ? AppColors.navyCardDark : Colors.white),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(18),
                                  topRight: const Radius.circular(18),
                                  bottomLeft: Radius.circular(isMe ? 18 : 4),
                                  bottomRight: Radius.circular(isMe ? 4 : 18),
                                ),
                                border: isMe
                                    ? null
                                    : Border.all(
                                        color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight,
                                        width: 1.2,
                                      ),
                                boxShadow: [
                                  BoxShadow(
                                    color: (isMe ? AppColors.cyanBrand : Colors.black).withAlpha(isDark ? 30 : 15),
                                    blurRadius: 10,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    msg.message,
                                    style: TextStyle(
                                      color: isMe
                                          ? Colors.white
                                          : (isDark ? AppColors.textWhite : AppColors.textDarkHeading),
                                      fontSize: 14,
                                      height: 1.35,
                                      fontWeight: isMe ? FontWeight.w500 : FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat('hh:mm a').format(msg.sentAt),
                                    style: TextStyle(
                                      color: isMe
                                          ? Colors.white.withAlpha(200)
                                          : (isDark ? AppColors.textDim : AppColors.textDarkSubtle),
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

              // Quick Study Action Pills
              Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _quickPill('📚 Central Library at 5PM?', isDark),
                    _quickPill('⚡ Hackathon sync call?', isDark),
                    _quickPill('💻 LeetCode #206 solved!', isDark),
                    _quickPill('☕ Filter coffee break?', isDark),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Message Input Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.navySurfaceDark : Colors.white.withAlpha(220),
                  border: Border(
                    top: BorderSide(
                      color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderLight,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _msgController,
                        style: TextStyle(
                          color: isDark ? AppColors.textWhite : AppColors.textDarkHeading,
                          fontSize: 14,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Type your message...',
                          hintStyle: TextStyle(
                            color: isDark ? AppColors.textDim : AppColors.textDarkSubtle,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: isDark ? AppColors.navyCardDark : AppColors.glassCardLightSolid,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: AppColors.cyanBrand, width: 1.6),
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.cyanActionGradient,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
                        onPressed: () => _sendMessage(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickPill(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () => _sendMessage(text),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: isDark ? AppColors.navyCardDark : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isDark ? AppColors.navyBorderDark : AppColors.glassBorderSubtle,
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(color: AppColors.cyanDark, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
