import 'package:directory_app/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController _pinputController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppImage.backgroundimage, fit: BoxFit.cover),
            ),

            _buildBodyContent(context),
            _buildHeader(context),
            _buildBottomButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topPadding + 10,
      right: 0,
      left: 0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  color: AppColor.primeryColor,
                ),

                const Spacer(),

                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Verify Your Otp",
                      style: AppTextstyle.semiblack18,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(thickness: 1, color: Colors.black26),
        ],
      ),
    );
  }

  Widget _buildBodyContent(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Positioned.fill(
      top: topPadding + 80,
      bottom: 110,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter OTP", style: AppTextstyle.semiblack18),
            const SizedBox(height: 6),

            Text(
              "Please enter your OTP that has been sent on your mobile number.",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 24),

            Text("OTP", style: AppTextstyle.semiblack18),
            const SizedBox(height: 10),
            Center(
              child: Pinput(
                controller: _pinputController,
                length: 4,

                defaultPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: AppTextstyle.semiblack18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primeryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                focusedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: AppTextstyle.semiblack18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primeryColor, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                submittedPinTheme: PinTheme(
                  width: 60,
                  height: 60,
                  textStyle: AppTextstyle.semiblack18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColor.primeryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),
            Center(
              child: Text.rich(
                TextSpan(
                  text: "Resend",
                  style: AppTextstyle.black16normal,
                  children: [
                    TextSpan(
                      text: "(30:00)",
                      style: TextStyle(
                        color: AppColor.primeryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton() {
    return Positioned(
      left: 20,
      right: 20,
      bottom: 20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: AppColor.primeryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text("Continue", style: AppTextstyle.semiwhite18),
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Text.rich(
              TextSpan(
                text: "By login you agree to our ",
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: AppColor.primeryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: "."),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
