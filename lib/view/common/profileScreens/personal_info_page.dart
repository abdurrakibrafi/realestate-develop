import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';

import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/models/profileModels/profile_model.dart';

import 'package:real_estate_management/viewModel/controllers/profileControllers/edit_profile_page_controller.dart';

class EditProfile extends StatelessWidget {
  final Data data;
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController jobController = TextEditingController();
  // final TextEditingController aboutController = TextEditingController();
  // final EditProfileController controller = Get.put(EditProfileController());

  // final Map<String, String> countryCodes = {
  //   '+965':
  //       'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/640px-Flag_of_the_United_Arab_Emirates.svg.png',
  //   '+1':
  //       'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg',
  // };

  EditProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final EditProfilePageController controller =
        Get.put(EditProfilePageController(data), permanent: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: commonText(
          'Edit Information',
          size: 24,
          isBold: true,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Obx(() {
                return Stack(
                  children: [
                    ClipOval(
                      child: controller.pickedImage.value == null
                          ? Image.network(
                              data.image ?? DummyImage.networkImage,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                              errorBuilder: (BuildContext context, Object exception,
                                  StackTrace? stackTrace) {
                                return Image.network(
                                  DummyImage.networkImage,
                                  fit: BoxFit.cover,
                                  width: 120,
                                  height: 120,
                                );
                              },
                            )
                          : Image.file(
                              controller.pickedImage.value!,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                           height: 40,
                            width: 40,
                              decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               color: AppColor.primaryColor,
                                border: Border.all(color: Colors.white,width: 2)
                              ),
                          child:  Image.asset("assets/icons/common/edit.png",color: Colors.white,scale: 3,),
                          ),
                        )
                    )
                  ],
                );
              }),
            ),
          //  const SizedBox(height: 10),
         /*   Center(
              child: GestureDetector(
                onTap: () {
                  controller.pickImage();
                },
                child: commonText("Edit Profile Photo",
                    size: 14, color: Colors.blue, isBold: true),
              ),
            ),*/
            const SizedBox(height: 16),
            commonTextfieldWithTitle("Name".tr, controller.nameController,
                hintText: "Enter your name".tr),
            const SizedBox(height: 16),
            commonTextfieldWithTitle("Email".tr, controller.emailController,
                hintText: "Enter your email".tr),
            const SizedBox(height: 16),

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
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xffFCFCFC),
                        borderRadius: BorderRadius.circular(6.0),
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
                                .map<DropdownMenuItem<String>>((String value) {
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
                      child: commonTextfield(controller.phoneController,
                          hintText: "Phone Number".tr,
                          keyboardType: TextInputType.number),
                    ),
                  ],
                ),
              ],
            ),
          /*  const SizedBox(height: 16),
            SizedBox(
              width: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("Nationality".tr, size: 14, isBold: true),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomDropdown(
                      controller: Get.find(tag: 'nationality'),
                      hintText: "Select your nationality".tr),
                ],
              ),
            ),*/
            /*const SizedBox(height: 16),
           SizedBox(
             width: 320,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 commonText("Marital Status".tr, size: 14, isBold: true),
                 const SizedBox(
                   height: 5,
                 ),
                 CustomDropdown(
                     controller: Get.find(tag: 'maritalStatus'),
                     hintText: "Select your marital status".tr),
               ],
             ),
           ),*/
            const SizedBox(height: 16),
            commonTextfieldWithTitle("Job".tr, controller.jobController,
                hintText: "Enter your job title".tr),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText("Monthly Income".tr, size: 14, isBold: true),
                const SizedBox(
                  height: 5,
                ),
                CustomDropdown(
                  controller: controller.monthlyIncomeController,
                  hintText: "Choose your income bracket".tr,
                ),
              ],
            ),
            const SizedBox(height: 16),
            commonTextfieldWithTitle("About me".tr, controller.aboutController,
                borderradious: 10, hintText: "Type here", maxLine: 5),
            const SizedBox(height: 24),
            Obx(() {
              return commonButton("Update".tr,
                  isLoading: controller.loading.value, onTap: () {
                controller.updateProfileApi(context: context);
              });
            }),
          ],
        ),
      ),
    );
  }
}

class EditProfileController extends GetxController {
  var selectedCountryCode = '+965'.obs;

  void selectCountryCode(String item) {
    selectedCountryCode.value = item;
  }
}
