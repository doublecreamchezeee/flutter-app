import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/image.dart';
import 'package:flutter_application_1/constants/sizes.dart';
import 'package:flutter_application_1/constants/string.dart';
import 'package:flutter_application_1/ui.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(image: AssetImage(tProfileImage))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      child: const Icon(CupertinoIcons.camera, color: Colors.black, size: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              
              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tFullName), prefixIcon: Icon(CupertinoIcons.person)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tEmail), prefixIcon: Icon(CupertinoIcons.mail)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      decoration: const InputDecoration(
                          label: Text(tPhone), prefixIcon: Icon(CupertinoIcons.phone)),
                    ),
                    const SizedBox(height: tFormHeight - 20),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: const Text(tPassword),
                        prefixIcon: const Icon(Icons.fingerprint),
                        suffixIcon:
                        IconButton(icon: const Icon(CupertinoIcons.eye_slash), onPressed: () {}),
                      ),
                    ),
                    const SizedBox(height: tFormHeight),
              
                    // -- Form Submit Button
                    BoxButton.outline(
                      title: tEditProfile,
                      onTap: () => Get.back()
                    ),
                    const SizedBox(height: tFormHeight),
              
                    // -- Created Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.green,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text(tJoined),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text(tDelete),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
