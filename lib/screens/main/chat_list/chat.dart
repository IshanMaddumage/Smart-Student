import 'package:flutter/material.dart';
import 'package:smart_student_academy/screens/main/chat_list/widget/chat_bottom.dart';
import 'package:smart_student_academy/screens/main/chat_list/widget/chat_bubble.dart';
import 'package:smart_student_academy/utils/app_color.dart';
import 'package:smart_student_academy/utils/widgets/custom_text.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        backgroundColor: kBlack,
        // leading: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: CircleAvatar(
        //     child: Image.network(
        //       'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: CircleAvatar(
                child: Image.network(
                  'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                  text: 'Ishan Maddumage',
                  color: kWhite,
                  fontWeight: FontWeight.w700,
                ),
                CustomText(
                  text: 'Active',
                  color: kWhite,
                  fontSize: 11,
                  fontWeight: FontWeight.w100,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) {
              return const ChatBubble();
            },
            itemCount: 10,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 15);
            },
          )),
          const ChatBottom(),
        ],
      ),
    );
  }
}
