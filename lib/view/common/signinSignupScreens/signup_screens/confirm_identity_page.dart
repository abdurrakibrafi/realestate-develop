import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/viewModel/controllers/profileControllers/identity_verification_controller.dart';

class ConfirmIdentity extends StatefulWidget {
  const ConfirmIdentity({super.key});

  @override
  State<ConfirmIdentity> createState() => _ConfirmIdentityState();
}

class _ConfirmIdentityState extends State<ConfirmIdentity> {
  int page = 0;

  IdentityVerificationController controller =
      Get.put(IdentityVerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              2,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 8,
                width: page == index
                    ? 43
                    : 10, // Adjust the size of the active dot
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: page == index
                      ? AppColor.primaryColor
                      : Colors.grey, // Adjust active and inactive dot colors
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  commonText("${page + 1}", color: AppColor.primaryColor),
                  commonText("/2", color: AppColor.blackColor),
                ],
              ),
            )
          ],
          backgroundColor: AppColor.whiteColor),
      body: SafeArea(
        child: (page == 0)
            ? SingleChildScrollView(child: ConfirmIdentityScreen1(
                voidFunction: () {
                  page = 1;
                  setState(() {});
                },
              ))
            : const ConfirmIdentityScreen2(),
      ),
    );
  }
}

class ConfirmIdentityScreen1 extends StatelessWidget {
  final dynamic voidFunction;
  const ConfirmIdentityScreen1({super.key, this.voidFunction});

  @override
  Widget build(BuildContext context) {
    IdentityVerificationController controller =
        Get.find<IdentityVerificationController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        commonText("Upload Your ID".tr,
            color: AppColor.blackColor, size: 24, isBold: true),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("Select ID Type".tr, size: 14, isBold: true),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                  controller: controller.idTypeController,
                  hintText: "Select your ID Type".tr),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: commonText("Upload your ID".tr, size: 16, isBold: true),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(() {
          return controller.documentImages.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: controller.documentImages.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            controller.documentImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      commonButton(
                        "Clear Photos",
                        onTap: () {
                          controller.documentImages.clear();
                        },
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [7, 7],
                    color: AppColor.primaryColor,
                    strokeWidth: 1,
                    borderPadding: const EdgeInsets.all(0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.blue.shade50),
                      width: double.infinity,
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 24,
                            child:
                                Image.asset("assets/icons/document-upload.png"),
                          ),
                          commonText("Front Side of You ID (Passport)".tr,
                              size: 14, isBold: true),
                          commonIconButton(
                            "Upload",
                            textColor: Colors.red,
                            icon: Image.asset("assets/icons/export.png"),
                            color: Colors.black87,
                            height: 40,
                            textSize: 16,
                            onTap: () => controller.pickImages(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        }),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(() {
                return Checkbox(
                  value: controller.isTermsAccepted.value,
                  onChanged: (value) {
                    controller.isTermsAccepted.value = value!;
                  },
                );
              }),
              Expanded(
                  child: commonText(
                      "I certify that the documents I have provided are original and accurate"
                          .tr)),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        commonButton("Next".tr, onTap: () {
          if (controller.validateFirstPage()) {
            voidFunction();
          }
        }),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class ConfirmIdentityScreen2 extends StatelessWidget {
  const ConfirmIdentityScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    IdentityVerificationController controller =
        Get.find<IdentityVerificationController>();
    return Obx(() {
      return controller.pickedImage.value != null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [7, 7],
                        color: AppColor.primaryColor,
                        strokeWidth: 1,
                        borderPadding: const EdgeInsets.all(0),
                        child: Container(
                          color: AppColor.whiteColor,
                          width: double.infinity,
                          height: double.infinity,
                          child: Image.file(
                            controller.pickedImage.value!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  commonBorderButton(
                    "Retake Photo",
                    onTap: () => controller.takeSelfie(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  commonButton("Submit", isLoading: controller.loading.value, onTap: () {
                    controller.api();
                  }),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(
                            'Take a Photo',
                            size: 24,
                            isBold: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                          ),
                          Expanded(
                            child: commonText(
                              'This step is crucial to match your face with your ID.',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                          ),
                          Expanded(
                            child: commonText(
                              'By taking a selfie, you help us maintain a secure and trustworthy community. Thank you for your cooperation!',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Icon(
                              Icons.circle,
                              size: 6,
                            ),
                          ),
                          Expanded(
                            child: commonText(
                              'Take a clear selfie to complete the verification process!',
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: const [7, 7],
                      color: AppColor.primaryColor,
                      strokeWidth: 1,
                      borderPadding: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.blue.shade50),
                        width: double.infinity,
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              "assets/icons/camera.png",
                              width: 80,
                              height: 80,
                            ),
                            commonIconButton("Open camera",
                                textColor: Colors.red, onTap: () {
                              controller.takeSelfie();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const TakePhoto()),
                              // );
                            },
                                icon: Image.asset(
                                    "assets/icons/camera_icon.png")),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
