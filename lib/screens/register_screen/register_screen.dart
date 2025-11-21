import 'package:directory_app/constants/constant.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();

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
              child: Image.asset(
                AppImage.backgroundimage,
                fit: BoxFit.cover,
              ),
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
                Icon(Icons.arrow_back_ios_outlined,
                    color: AppColor.primeryColor),

                const Spacer(),

                Expanded(
                  flex: 4,
                  child: Center(
                    child: Text(
                      "Verify your phone number",
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
            Text("Get started with your phone number",
                style: AppTextstyle.semiblack18),
            const SizedBox(height: 6),


            Text(
              "Please Enter Your Mobile Number to Continue.",
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 24),

            Text("Phone Number", style: AppTextstyle.semiblack18),
            const SizedBox(height: 10),

            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.borderColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                 Image.asset(AppImage.indiaflag,height: 30,width: 41,),
                  const SizedBox(width: 8),
                  Text("+91", style: AppTextstyle.black16normal),
                  const SizedBox(width: 10),

                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter phone number",
                      ),
                      style: AppTextstyle.black16normal,
                    ),
                  ),
                ],
              ),
            ),

             SizedBox(height: 30),
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
              child: Text(
                "Continue",
                style: AppTextstyle.semiwhite18,
              ),
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
