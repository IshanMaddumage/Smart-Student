import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:smart_student_academy/utils/app_color.dart';

import '../../../../utils/widgets/custom_text.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    this.isSender = true,
  }) : super(key: key);
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        BubbleSpecialThree(
          text: 'Added iMassage shape bubbles',
          color: isSender
              ? const Color(0xFF1B97F3)
              : const Color.fromARGB(255, 127, 185, 229),
          isSender: isSender,
          tail: true,
          textStyle: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomText(
            text: '1 minite ago',
            fontSize: 8,
            color: kWhite,
          ),
        ),
      ],
    );
  }
}
