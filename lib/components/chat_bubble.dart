import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message ;
  const ChatBubble({
    super.key,
    required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child: Text(
      message,
      style: const TextStyle(fontSize: 16),        
      )
    );
  }
}