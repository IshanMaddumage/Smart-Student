import 'package:flutter/material.dart';
import 'package:smart_student_academy/screens/main/chat_list/chat.dart';
import 'package:smart_student_academy/utils/util_functions.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/widgets/custom_text.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        UtilFunctions.navigateTo(
          context,
          const Chat(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kWhite,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  'https://www.pngfind.com/pngs/m/62-626956_profile-man-icon-hd-png-download.png',
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: 'Ishan Maddumage',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 4),
                    CustomText(
                      text: 'how are you?',
                      fontSize: 10,
                      color: Colors.black45,
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.circle,
                  size: 12,
                  color: Colors.green,
                )
              ],
            ),
            const CustomText(
              text: '1 minite ago',
              fontSize: 8,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}
