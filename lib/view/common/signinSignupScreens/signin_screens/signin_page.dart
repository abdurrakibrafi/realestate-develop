import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:real_estate_management/controller/google%20auth%20controller/google_auth_controller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/forgetPasswordScreens/forget_password_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_signup_root_page.dart';
import 'package:real_estate_management/viewModel/controllers/authControllers/signin_view_model.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final loginViewModel = Get.put(SigninViewModel());
  final _formkey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  bool _obscurePassword = true;

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;
      if (user != null) {
        // Print the user's email and name
        print("User Email: ${user.email}");
        print("User Name: ${user.displayName}");
      }
      return user;
    } catch (e) {
      print("Google sign-in failed: $e");
      return null;
    }
  }

  Future<User?> _signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: 'com.your.bundle.id', // Replace with your client ID
          redirectUri: Uri.parse('https://your-redirect-uri.com/callback'),
        ),
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      User? user = userCredential.user;
      if (user != null) {
        print("User Email: ${user.email}");
        print("User Name: ${user.displayName}");
      }
      return user;
    } catch (e) {
      print("Apple sign-in failed: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/bg-image.jpg",
              fit: BoxFit.fill,
            )),
        const Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // Optional indicator for sign-up steps
          ]),
        )
      ]),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20.0),
                commonText(
                  'Welcome Back!'.tr,
                  size: 24,
                  isBold: true,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                commonText(
                  'Log In to your Placoo account to explore your dream place to live across the whole world!'
                      .tr,
                  size: 12,
                  color: Colors.grey[600]!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      commonTextfieldWithTitle(

                          "Email".tr, loginViewModel.emailController.value,
                          focusNode: loginViewModel.emailFocusNode.value,
                          onValidate: (value) {
                        if (value!.isEmpty) {
                          Utils.snackBar("Email", "Please enter email");
                        }
                        return null;
                      }, onFieldSubmit: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginViewModel.emailFocusNode.value,
                            loginViewModel.passwordFocusNode.value);
                      },
                          hintText: "Enter your email".tr,
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(
                        height: 20,
                      ),
                      commonTextfieldWithTitle(
                        "Password".tr,
                        loginViewModel.passwordController.value,
                        focusNode: loginViewModel.passwordFocusNode.value,
                        obscureText: _obscurePassword,
                        onValidate: (value) {
                          if (value!.isEmpty) {
                            Utils.snackBar("Password", "Please enter password");
                          }
                          return null;
                        },
                        onFieldSubmit: (value) {},
                        hintText: "Enter your password".tr,
                        keyboardType: TextInputType.visiblePassword,
                        suffixWidget: IconButton(
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ) ?? SizedBox(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: commonText("Forgot password?".tr,
                            color: AppColor.primaryColor),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () => commonButton(
                    "Login".tr,
                    isLoading: loginViewModel.loading.value,
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        loginViewModel.loginApi();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(),
                    )),
                    commonText("Or register using".tr, color: Colors.grey),
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

                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithCredential(credential);

                              if (userCredential.user != null) {
                                final String email =
                                    userCredential.user!.email!;
                                final String name =
                                    userCredential.user!.displayName ??
                                        "No Name";

                                await authController.signInWithGoogle(
                                  email: email,
                                  role: '',
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
                            User? user = await _signInWithApple();
                            if (user != null) {}
                          },
                          label: commonText("Apple ID"),
                          icon: Image.asset("assets/icons/apple.png"),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonText("Don't have an account?".tr),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const LoginChooserScreen()),
                          );
                        },
                        child: commonText("  Register".tr,
                            color: AppColor.primaryColor)),
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required IconData icon,
    required String text,
    required int value,
    required int? groupValue,
    required Function(int?) onTap,
  }) {
    return GestureDetector(
      onTap: () => onTap(value),
      child: Container(
        decoration: BoxDecoration(
          color: value == groupValue ? Colors.orange : AppColor.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            width: 2,
            color: value == groupValue ? Colors.transparent : Colors.black12,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: (loginViewModel.selectedValue.value == value)
                              ? Colors.transparent
                              : AppColor.blackColor),
                      shape: BoxShape.circle,
                      color: AppColor.whiteColor,
                    ),
                    child: Icon(
                      icon,
                      size: 24.0,
                      color: value == groupValue
                          ? Colors.orange
                          : Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      color: value == groupValue
                          ? AppColor.whiteColor
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Radio<int>(
                value: value,
                groupValue: groupValue,
                onChanged: (int? newValue) {
                  onTap(newValue);
                },
                activeColor: AppColor.whiteColor,
                fillColor: WidgetStateProperty.all(
                  value == groupValue ? AppColor.whiteColor : Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
