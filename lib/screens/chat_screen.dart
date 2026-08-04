import 'dart:async';

import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../theme/app_colors.dart';
import '../widgets/ai_bubble.dart';
import '../widgets/bottom_input_area.dart';
import '../widgets/intro_header.dart';
import '../widgets/sidebar.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/typing_indicator.dart';
import '../widgets/user_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int _selectedTab = 0; // 0 = GPT-4, 1 = Claude 3, 2 = Gemini
  bool _isTyping = false;

  final List<ChatMessage> _messages = [
    ChatMessage(
      sender: Sender.user,
      text: 'Hola, ¿puedes ayudarme a programar una función en Python?',
    ),
    ChatMessage(
      sender: Sender.ai,
      text:
          '¡Hola! Por supuesto. ¿Qué tipo de función necesitas? Puedo ayudarte con lógica, procesamiento de datos o integración de APIs.',
      cards: const [
        SuggestionCard('Logic Example', 'Create a recursive sorting algorithm.'),
        SuggestionCard('API Integration', 'Fetch weather data using a REST client.'),
      ],
    ),
  ];

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty || _isTyping) return;
    setState(() {
      _messages.add(ChatMessage(sender: Sender.user, text: text));
      _isTyping = true;
      _controller.clear();
    });
    _scrollToBottom();
    // Aquí engancharías la llamada real a tu backend / Groq SDK.
    Timer(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      setState(() {
        _isTyping = false;
        _messages.add(ChatMessage(
          sender: Sender.ai,
          text: '¡Listo! Respuesta simulada para "$text". Conecta tu backend '
              'para obtener una respuesta real.',
          cards: const [
            SuggestionCard('Logic Example', 'Create a recursive sorting algorithm.'),
            SuggestionCard('API Integration', 'Fetch weather data using a REST client.'),
          ],
        ));
      });
      _scrollToBottom();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Layout responsivo: sidebar visible solo en pantallas anchas (>= 768px)
    final isWide = MediaQuery.of(context).size.width >= 768;
    final hasUserMessages = _messages.any((m) => m.sender == Sender.user);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: isWide ? null : const Sidebar(),
      body: Row(
        children: [
          if (isWide) const Sidebar(),
          Expanded(
            child: Column(
              children: [
                TopAppBar(
                  isWide: isWide,
                  selectedTab: _selectedTab,
                  onTabSelected: (i) => setState(() => _selectedTab = i),
                  onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                Expanded(
                  child: ListView(
                    controller: _scrollController,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    children: [
                      if (!hasUserMessages) ...[
                        const IntroHeader(),
                        const SizedBox(height: 24),
                      ],
                      ..._messages.map((m) => Padding(
                            padding: const EdgeInsets.only(bottom: 24),
                            child: m.sender == Sender.user
                                ? UserBubble(text: m.text)
                                : AiBubble(text: m.text, cards: m.cards),
                          )),
                      if (_isTyping)
                        const Padding(
                          padding: EdgeInsets.only(bottom: 24),
                          child: TypingIndicator(),
                        ),
                    ],
                  ),
                ),
                BottomInputArea(
                  controller: _controller,
                  onSend: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}