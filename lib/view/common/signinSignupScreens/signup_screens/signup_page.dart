import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate_management/controller/google%20auth%20controller/google_auth_controller.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_signup_root_page.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/signup_page_controller.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signup_screens/compleate_registration_page.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class SignupPage extends StatelessWidget {
  final String role;
  const SignupPage({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    print(role);
    final SignupPageController controller = Get.put(SignupPageController(role));
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/Logo.png",
                        width: MediaQuery.of(context).size.height * 0.8,
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                    ],
                  ),
                  Center(
                    child: commonText("Create Your Account".tr,
                        size: 24, color: AppColor.blackColor, isBold: true),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  commonTextfieldWithTitle(
                      "Username".tr, controller.usernameController,
                      hintText: "Enter your username".tr,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfieldWithTitle(
                      "Full Name".tr, controller.fullNameController,
                      hintText: "Enter your name".tr,
                      keyboardType: TextInputType.text),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfieldWithTitle(
                      "Email".tr, controller.emailController,
                      hintText: "Enter your email".tr,
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 20,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonText("Phone Number".tr, size: 14),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0),
                              color: const Color(0xffFCFCFC),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(
                                () => DropdownButton<String>(
                                  value: controller.selectedCountryCode.value,
                                  onChanged: (String? newValue) {
                                    controller.selectCountryCode(newValue!);
                                  },
                                  items: controller.countryCodes.keys
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Row(
                                        children: [
                                          Image.network(
                                            controller.countryCodes[value]!,
                                            width: 24,
                                            height: 24,
                                          ),
                                          const SizedBox(width: 8),
                                          commonText(value),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: commonTextfield(controller.phoneNumberController,
                                hintText: "Phone Number".tr,
                                keyboardType: TextInputType.number),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextfieldWithTitle(
                      "Password".tr, controller.passwordController,
                      hintText: "Enter your password".tr,
                      keyboardType: TextInputType.visiblePassword),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Obx(() => CheckboxListTile(
                              activeColor: AppColor.primaryColor,
                              title: commonText(
                                  "I have read and accepted the rules & conditions"
                                      .tr,
                                  size: 14),
                              value: controller.isTermsAccepted.value,
                              onChanged: (bool? value) {
                                controller.isTermsAccepted.value = value!;
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  commonButton("Register".tr, onTap: () {
                    if (controller.validateForm()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                 CompleateRegistrationPage(role: role,)),
                      );
                    }
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText("Already have an account?".tr),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginChooserScreen()),
                            );
                          },
                          child: commonText("Login".tr,
                              color: AppColor.primaryColor)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(),
                      )),
                      commonText("Or register using", color: Colors.grey),
                      const Expanded(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              try {
                                // Initiate Google Sign-In
                                final GoogleSignInAccount? googleUser =
                                    await GoogleSignIn().signIn();

                                if (googleUser == null) {
                                  // The user canceled the sign-in
                                  return;
                                }

                                // Retrieve authentication details from Google
                                final GoogleSignInAuthentication googleAuth =
                                    await googleUser.authentication;

                                // Create a credential for Firebase
                                final AuthCredential credential =
                                    GoogleAuthProvider.credential(
                                  accessToken: googleAuth.accessToken,
                                  idToken: googleAuth.idToken,
                                );

                                // Sign in to Firebase with the Google user
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithCredential(credential);

                                if (userCredential.user != null) {
                                  // Get the user's details
                                  final String email =
                                      userCredential.user!.email!;
                                  final String name =
                                      userCredential.user!.displayName ??
                                          "No Name";

                                  // Call your API with the Google account details
                                  await authController.signInWithGoogle(
                                    email: email,
                                    role: role,
                                    name: name,
                                  );
                                }
                              } catch (e) {
                                print("Google Sign-In Error: $e");
                              }
                            },
                            label: commonText("Google"),
                            icon: Image.asset("assets/icons/google.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              // Implement Apple ID Sign-In logic here
                            },
                            label: commonText("Apple ID"),
                            icon: Image.asset("assets/icons/apple.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
