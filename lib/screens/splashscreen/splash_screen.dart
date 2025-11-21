import 'dart:async';
import 'package:directory_app/constants/constant.dart';
import 'package:directory_app/screens/splashscreen/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    /// 3-second delay and then navigate
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// BACKGROUND IMAGE
          Positioned.fill(
            child: Image.asset(
              AppImage.backgroundimage,
              fit: BoxFit.cover,
            ),
          ),

          /// CENTER SPLASH IMAGE
          Center(
            child: Image.asset(
              AppImage.splashimage,
              fit: BoxFit.contain,
            ),
          ),

          /// LOGO TEXT AT BOTTOM
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LOGO",
                    style: AppTextstyle.semiblack24,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("L", style: AppTextstyle.semiblack14),
                      const SizedBox(width: 6),
                      Text("o", style: AppTextstyle.semiblack14),
                      const SizedBox(width: 6),
                      Text("g", style: AppTextstyle.semiblack14),
                      const SizedBox(width: 6),
                      Text("o", style: AppTextstyle.semiblack14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
