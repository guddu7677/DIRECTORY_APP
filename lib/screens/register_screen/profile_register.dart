import 'package:directory_app/constants/constant.dart';
import 'package:directory_app/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class ProfileRegister extends StatefulWidget {
  const ProfileRegister({super.key});

  @override
  State<ProfileRegister> createState() => _ProfileRegisterState();
}

class _ProfileRegisterState extends State<ProfileRegister> {
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
            _backgroundImage(),
            _header(),
            _profileContent(),
          ],
        ),
      ),
      bottomNavigationBar: _bottomButton(),
    );
  }

  // ---------------- BACKGROUND IMAGE ----------------
  Widget _backgroundImage() {
    return Positioned(
      top: 90,
      left: 0,
      right: 0,
      child: Image.asset(
        AppImage.profileBG,
        height: 270,
        fit: BoxFit.cover,
        opacity: const AlwaysStoppedAnimation(0.6),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header() {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topPadding + 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_outlined,
                  color: AppColor.primeryColor),
            ),
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
    );
  }

  // ---------------- PROFILE IMAGE + BANNER ----------------
  Widget _profileContent() {
    return Positioned(
      top: 180,
      left: 0,
      right: 0,
      child: Column(
        children: [
           Icon(Icons.camera_alt_outlined,
              color: Colors.white.withOpacity(0.4) ,
              size: 40),
          const SizedBox(height: 10),
           Text(
            "Add banner",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
           SizedBox(height: 60),

          // Profile Picture
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 126,
                width: 126,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColor.borderColor),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImage.profileimage),
                  ),
                ),
              ),

              // Camera Icon
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(Icons.camera_alt_outlined, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- BOTTOM CONTINUE BUTTON ----------------
  Widget _bottomButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
      child: UniversalButton(
        title: "Continue",
        textColor: Colors.white,
        bgColor: AppColor.primeryColor,
        borderRadius: 12,
        onTap: () {
          // TODO: add next screen
        },
      ),
    );
  }
}
