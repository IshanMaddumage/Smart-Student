import 'package:flutter/material.dart';
import 'package:smart_student_academy/utils/widgets/custom_text.dart';
import 'package:smart_student_academy/utils/util_functions.dart';
import 'package:smart_student_academy/utils/widgets/custom_button.dart';
import 'package:smart_student_academy/utils/widgets/custom_text_field.dart';
import '../main/home.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final _userName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/forget.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: const [
                          CustomText(
                            text: 'Forgot Password',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        lableText: 'User Name',
                        controller: _userName,
                      ),
                      CustomButton(
                        text: 'Reset Password',
                        onTap: () {
                          UtilFunctions.navigateTo(
                            context,
                            const Home(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
