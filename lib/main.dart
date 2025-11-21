import 'package:directory_app/screens/optscreen/otp_screen.dart';
import 'package:directory_app/screens/register_screen/profile_register.dart';
import 'package:directory_app/screens/register_screen/register_screen.dart';
import 'package:directory_app/screens/splashscreen/onboarding_screen.dart';
import 'package:directory_app/screens/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DIRECTORY',
      home: ProfileRegister() ,
      debugShowCheckedModeBanner: false,
    routes: {
      "/SplashScreen":(context)=>SplashScreen(),
      "/OnboardingScreen":(context)=>OnboardingScreen(),
      "/RegisterScreen":(context)=>RegisterScreen(),
      "/OtpScreen":(context)=>OtpScreen(),
      "/ProfileRegister":(context)=>ProfileRegister(),
    },
    );
  }
}
