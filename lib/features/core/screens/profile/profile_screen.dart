import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/features/core/screens/profile/profile_bar.dart';
import 'package:flutter_application_1/features/core/screens/profile/profile_menu.dart';
import 'package:flutter_application_1/features/core/screens/profile/profile_update.dart';
import 'package:flutter_application_1/repository/auth_repository.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: customAppBar("Profile"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [

              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), child: const Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: const Color.fromARGB(255,255,255,255)),
                      child: const Icon(
                        CupertinoIcons.pencil_outline,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const BoxText.headingSmall(tProfileHeading),
              const BoxText.caption(tProfileSubHeading),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: BoxButton(
                  title: tEditProfile,
                  onTap: () => Get.to(() => const UpdateProfileScreen())
                ),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Settings", icon: CupertinoIcons.gear, onPress: () {}),
              ProfileMenuWidget(title: "Billing Details", icon: CupertinoIcons.creditcard, onPress: () {}),
              ProfileMenuWidget(title: "User Management", icon: CupertinoIcons.person_crop_circle_badge_checkmark, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Information", icon: CupertinoIcons.info, onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: CupertinoIcons.escape,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {
                    Get.defaultDialog(
                      title: "LOGOUT",
                      titleStyle: const TextStyle(fontSize: 20),
                      content: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Text("Are you sure, you want to Logout?"),
                      ),
                      confirm: Expanded(
                        child: ElevatedButton(
                          onPressed: () => AuthenticationRepository.instance.logout(),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, side: BorderSide.none),
                          child: const Text("Yes"),
                        ),
                      ),
                      cancel: OutlinedButton(onPressed: () => Get.back(), child: const Text("No")),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}