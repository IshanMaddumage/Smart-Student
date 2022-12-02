import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_student_academy/providers/caurces.dart';
import 'package:smart_student_academy/utils/app_color.dart';
import 'package:smart_student_academy/utils/widgets/custom_app_bar.dart';
import 'package:smart_student_academy/utils/widgets/custom_name_field.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      appBar: const CustomAppBar(name: 'My Profile'),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Consumer<Cources>(
                    builder: (context, value, child) {
                      return value.getImage.path == ''
                          ? InkWell(
                              onTap: () {
                                value.slectImage();
                              
                              },
                              child: const CircleAvatar(
                                backgroundColor: kWhite,
                                radius: 50,
                                child: Icon(
                                  Icons.person,
                                  size: 70,
                                  color: kBlack,
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                value.slectImage();
                              },
                              child: CircleAvatar(
                                  backgroundColor: kWhite,
                                  radius: 50,
                                  backgroundImage: FileImage(value.getImage)),
                            );
                    },
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomNameField(
                      icon: Icons.person,
                      text1: 'Name',
                      text2: 'Ishan Maddumage',
                    ),
                    CustomNameField(
                      icon: Icons.date_range,
                      text1: 'Date Of Birth',
                      text2: '1998/01/30',
                    ),
                    CustomNameField(
                      icon: Icons.phone,
                      text1: 'Phone Number',
                      text2: '0715644093',
                    ),
                    CustomNameField(
                      icon: Icons.male,
                      text1: 'Gender',
                      text2: 'Male',
                    ),
                    CustomNameField(
                      icon: Icons.location_pin,
                      text1: 'Address',
                      text2: 'No 100, Main Street, Maradankadawala',
                    ),
                    CustomNameField(
                      icon: Icons.school,
                      text1: 'School or University',
                      text2: 'University College Anuradhapura',
                    ),
                    CustomNameField(
                      icon: Icons.mail,
                      text1: 'Email Address',
                      text2: 'ishan.tulaksha00@gmail.com',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
