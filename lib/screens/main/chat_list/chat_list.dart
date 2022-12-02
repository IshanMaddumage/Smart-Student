import 'package:flutter/material.dart';
import 'package:smart_student_academy/screens/main/chat_list/widget/chat_card.dart';
import 'package:smart_student_academy/utils/app_color.dart';
import 'package:smart_student_academy/utils/widgets/custom_app_bar.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: const CustomAppBar(name: 'Chats'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return const ChatCard();
                },
                itemCount: 20,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
