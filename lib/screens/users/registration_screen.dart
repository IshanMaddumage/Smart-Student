import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_student_academy/controllers/auth_controller.dart';
import 'package:smart_student_academy/utils/alert_helper.dart';
import 'package:smart_student_academy/utils/widgets/custom_text.dart';
import 'package:smart_student_academy/utils/util_functions.dart';
import 'package:smart_student_academy/utils/widgets/custom_button.dart';
import 'package:smart_student_academy/utils/widgets/custom_text_field.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _firstName = TextEditingController();

  final _lastName = TextEditingController();

  final _birthday = TextEditingController();

  final _mobileNumber = TextEditingController();

  final _gender = TextEditingController();

  final _address = TextEditingController();

  final _school = TextEditingController();

  final _email = TextEditingController();

  final _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/boys.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: const [
                          CustomText(
                            text: 'Register',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        lableText: 'First Name',
                        controller: _firstName,
                      ),
                      CustomTextField(
                        lableText: 'Last Name',
                        controller: _lastName,
                      ),
                      CustomTextField(
                        lableText: 'Birthday',
                        controller: _birthday,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _birthday.text =
                                  DateFormat('yyyy.MM.dd').format(pickedDate);
                            });
                          }
                        },
                      ),
                      CustomTextField(
                        lableText: 'Mobile Number',
                        controller: _mobileNumber,
                      ),
                      CustomTextField(
                        lableText: 'Gender',
                        controller: _gender,
                        onTap: () {},
                      ),
                      CustomTextField(
                        lableText: 'Address',
                        controller: _address,
                      ),
                      CustomTextField(
                        lableText: 'School or University',
                        controller: _school,
                      ),
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
                              text: 'Sign Up',
                              onTap: () async {
                                if (validateFields(context)) {
                                  //start the loader
                                  setState(() {
                                    isLoading = true;
                                  });

                                  //calling register user function
                                  await AuthController().registerUser(
                                    context,
                                    _email.text,
                                    _password.text,
                                    _firstName.text,
                                    _lastName.text,
                                    _birthday.text,
                                    _mobileNumber.text,
                                    _gender.text,
                                    _address.text,
                                    _school.text,
                                  );

                                  clearDatas();

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
                              clearDatas();
                              UtilFunctions.navigateback(context);
                            },
                            child: const Text('Already have account?'),
                          ),
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
    );
  }

  void clearDatas() {
    _firstName.clear();
    _lastName.clear();
    _birthday.clear();
    _mobileNumber.clear();
    _gender.clear();
    _address.clear();
    _school.clear();
    _email.clear();
    _password.clear();
  }

  bool validateFields(BuildContext context) {
    if (_email.text.isEmpty ||
        _password.text.isEmpty ||
        _firstName.text.isEmpty ||
        _lastName.text.isEmpty ||
        _birthday.text.isEmpty ||
        _mobileNumber.text.isEmpty ||
        _gender.text.isEmpty ||
        _address.text.isEmpty ||
        _school.text.isEmpty ||
        _email.text.isEmpty ||
        _password.text.isEmpty) {
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
    } else if (_mobileNumber.text.length < 10) {
      AlertHelper().showAlert(
          context, DialogType.error, 'ERROR', 'Enter a valid phone number!');
      return false;
    } else {
      return true;
    }
  }
}
