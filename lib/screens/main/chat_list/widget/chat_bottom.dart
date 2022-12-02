import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_student_academy/utils/app_color.dart';

class ChatBottom extends StatelessWidget {
  const ChatBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      onSend: (_) => print(_),
      messageBarColor: kBlack,
    );
  }
}
