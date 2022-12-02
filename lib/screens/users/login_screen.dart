import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:smart_student_academy/controllers/auth_controller.dart';
import 'package:smart_student_academy/screens/users/forgot_password_screen.dart';
import 'package:smart_student_academy/screens/users/registration_screen.dart';
import 'package:smart_student_academy/utils/alert_helper.dart';
import 'package:smart_student_academy/utils/util_functions.dart';
import 'package:smart_student_academy/utils/widgets/custom_button.dart';
import 'package:smart_student_academy/utils/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();

  final _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const Image(
                    image: AssetImage('assets/login.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Welcome to Smart Student',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 108, 97, 97),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'A  C  A  D  E  M  Y',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          lableText: 'User Name',
                          controller: _email,
                        ),
                        CustomTextField(
                          lableText: 'Password',
                          controller: _password,
                          isObscure: true,
                        ),
                        isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : CustomButton(
                                text: 'Login',
                                onTap: () async {
                                  if (validateFields(context)) {
                                    //start the loader
                                    setState(() {
                                      isLoading = true;
                                    });

                                    //calling register user function
                                    await AuthController().logingUser(
                                      context,
                                      _email.text,
                                      _password.text,
                                    );

                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _email.clear();
                                  _password.clear();
                                  UtilFunctions.navigateTo(
                                    context,
                                    const RegistrationScreen(),
                                  );
                                },
                                child: const Text('Register Now')),
                            TextButton(
                                onPressed: () {
                                  _email.clear();
                                  _password.clear();
                                  UtilFunctions.navigateTo(
                                      context, ForgotPassword());
                                },
                                child: const Text('Forgot Password?')),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateFields(BuildContext context) {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      AlertHelper().showAlert(
          context, DialogType.error, 'ERROR', 'Fill all the fields!');
      return false;
    } else if (!_email.text.contains("@")) {
      AlertHelper().showAlert(
          context, DialogType.error, 'ERROR', 'Enter a valid email!');
      return false;
    } else if (!_email.text.contains(".com")) {
      AlertHelper().showAlert(
          context, DialogType.error, 'ERROR', 'Enter a valid email!');
      return false;
    } else {
      return true;
    }
  }
}
