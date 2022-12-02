import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_student_academy/providers/auth_provider.dart';
import 'package:smart_student_academy/providers/joincource.dart';
import 'package:smart_student_academy/providers/caurces.dart';
import 'package:smart_student_academy/screens/main/home_page/cource_detail_screen.dart';
import 'package:smart_student_academy/screens/main/my_cources/my_cources.dart';
import 'package:smart_student_academy/screens/splash/splash_screen.dart';
import 'package:smart_student_academy/utils/app_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: Cources(),
        ),
        ChangeNotifierProvider.value(
          value: JoinCource(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Smart Student',
        theme: ThemeData(
          primarySwatch: kPrimary,
          fontFamily: 'Lato',
        ),
        home: const SplashScreen(),
        routes: {
          MyCources.rauteName: (context) => const MyCources(),
          CourceDetailScreen.rauteName: (context) => const CourceDetailScreen(),
        },
      ),
    );
  }
}
