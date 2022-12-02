import 'package:flutter/material.dart';
import 'package:smart_student_academy/controllers/auth_controller.dart';
import 'package:smart_student_academy/utils/widgets/cource_grid.dart';
import 'package:smart_student_academy/utils/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(
        name: 'Smart Student',
        action: [
          IconButton(
            onPressed: () {
              AuthController().logOut();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: const CourceGrid(),
    );
  }
}
