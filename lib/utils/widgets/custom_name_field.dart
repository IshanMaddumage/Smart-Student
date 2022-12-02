import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomNameField extends StatelessWidget {
  const CustomNameField({
    super.key,
    required this.icon,
    required this.text1,
    required this.text2,
  });
  final IconData icon;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: text1,
                fontSize: 12,
                color: Colors.black87,
              ),
              CustomText(
                text: text2,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
