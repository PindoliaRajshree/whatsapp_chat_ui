import 'package:flutter/material.dart';
import 'package:whatsapp_chat_ui/views/chat_page.dart';

void main() {
  runApp(const WhatsAppChatUI());
}

class WhatsAppChatUI extends StatelessWidget {
  const WhatsAppChatUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Chat UI',
      home: ChatPage(),
    );
  }
}
