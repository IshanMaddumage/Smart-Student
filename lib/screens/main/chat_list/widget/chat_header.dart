import 'package:flutter/material.dart';

import '../../../../utils/widgets/custom_text.dart';

class ChatHeader extends StatelessWidget {
  const ChatHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          'https://www.pngfind.com/pngs/m/62-626956_profile-man-icon-hd-png-download.png',
          width: 35,
          height: 35,
        ),
        const CustomText(text: 'Ishan Maddumage')
      ],
    );
  }
}
