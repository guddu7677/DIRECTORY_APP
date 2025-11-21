import 'package:directory_app/constants/constant.dart';
import 'package:directory_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "image": AppImage.firstsplashimage,
      "title": "BE BETTER",
      "subtitle":
          "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum lorimm ipsum",
    },
    {
      "image": AppImage.secsplashimage,
      "title": "LEARN MORE",
      "subtitle":
          "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum lorimm ipsum",
    },
    {
      "image": AppImage.thisplashimage,
      "title": "ACHIEVE GOALS",
      "subtitle":
          "Lorim ipsum lorim ipsum lorim ipsum lorim ipsum lorimm ipsum",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // -------- PAGEVIEW AREA --------
            Expanded(
              flex: 7,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // IMAGE BOX
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColor.primeryColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.borderColor),
                          ),
                          child: Image.asset(
                            data["image"],
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // TITLE
                        Text(data["title"], style: AppTextstyle.semiblack24),

                        const SizedBox(height: 8),

                        Text(
                          data["subtitle"],
                          textAlign: TextAlign.center,
                          style: AppTextstyle.semiblack18,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 10,
                  width: currentIndex == index ? 30 : 10,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColor.primeryColor
                        : AppColor.primeryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: UniversalButton(
                      title: "Register",
                      textColor: AppColor.primeryColor,
                      onTap: () {
                        Navigator.pushNamed(context, "/RegisterScreen");
                      },
                      borderColor: AppColor.borderColor,
                    ),
                  ),

                  const SizedBox(width: 16),
                  Expanded(
                    child: UniversalButton(
                      title: "Log in",
                      textColor: Colors.white,
                      onTap: () {},
                      bgColor: AppColor.primeryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
