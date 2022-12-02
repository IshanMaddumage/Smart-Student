import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:smart_student_academy/screens/main/chat_list/chat_list.dart';
import 'package:smart_student_academy/screens/main/home_page/home_page.dart';
import 'package:smart_student_academy/screens/main/my_cources/my_cources.dart';
import 'package:smart_student_academy/screens/main/profile/profile.dart';
import 'package:smart_student_academy/utils/app_color.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screen = [
    const HomePage(),
    const MyCources(),
    const ChatList(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                color: kWhite,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            iconTheme: MaterialStateProperty.all(
              const IconThemeData(
                color: Colors.white,
              ),
            ),
            backgroundColor: kBlack,
            indicatorColor: Colors.white24,
          ),
          child: NavigationBar(
            animationDuration: const Duration(seconds: 2),
            height: 60,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: (index) => setState(() {
              this.index = index;
            }),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                // selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.menu_book_outlined),
                label: 'My Cource',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_outlined),
                label: 'Chat',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Profile',
              )
            ],
          ),
        ).asGlass(),
        body: screen[index],
      ),
    );
  }
}
