// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:real_estate_management/models/profileModels/profile_model.dart';

// import 'package:real_estate_management/res/components/common_button.dart';
// import 'package:real_estate_management/res/components/common_dropdown.dart';
// import 'package:real_estate_management/res/components/common_text.dart';
// import 'package:real_estate_management/res/components/common_textfield.dart';
// import 'package:real_estate_management/viewModel/controllers/authControllers/signup_page_controller.dart';
// import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';
// import 'package:real_estate_management/viewModel/controllers/profileControllers/edit_profile_page_controller.dart';
// import 'package:real_estate_management/res/colors/colors.dart';
// import 'package:real_estate_management/res/assets/images.dart';

// class EditProfilePage extends StatefulWidget {
//   final Data data;

//   const EditProfilePage({super.key, required this.data});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final SignupPageController phoneController = Get.put(SignupPageController());
//   String imageUrl =
//           "https://s3-alpha-sig.figma.com/img/b988/32d8/09b854f807afd5d39bee262977ae092a?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lTmiC6Upy0ptW5Ly9tsNJtqjSBzPK7d~VS8UFhko2ueDwK-tKFc8Qe~jjucSY6txbqSF077vYmiOYDKmud4YccG4Os1WLlsWGyMeM3r4chrE40iE7g9~nrUkQ6KXo53vp1dlPUM3M55wQxiBP9B9ZhIyXSyM8mLF0tMi2hbjlLxbezKjn8q9gdm484b5KWIpqQ8yOdLDtJPnox0YWx2FzuH2T8Ix2VI80oOr7-o0RJJ9E~-l1RotFT9CGRERl79MNK5WqI-AW4mwD5mWqdw1Q~Hj3ZbbT6udTG4btlQp0osjCpiwzglaLo04Q~Cos9I13vG~beFP2R4fBAtsLFGXBQ__",
//       email = "Jhondeo@gmail.com",
//       name = "Jhon Deo",
//       gender = "Male",
//       location = "Usa",
//       phone = "0157454545",
//       contactNumbers = "";
//   final Map<String, String> countryCodes = {
//     '+965':
//         'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Flag_of_the_United_Arab_Emirates.svg/640px-Flag_of_the_United_Arab_Emirates.svg.png',
//     '+1':
//         'https://cdn.britannica.com/79/4479-050-6EF87027/flag-Stars-and-Stripes-May-1-1795.jpg',
//   };
//   TextEditingController nameController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController dayController = TextEditingController();
//   TextEditingController mounthController = TextEditingController();
//   TextEditingController yearController = TextEditingController();
//   TextEditingController numberController = TextEditingController();
//   TextEditingController nationalityController = TextEditingController();
//   TextEditingController maritalStatusController = TextEditingController();
//   TextEditingController birthDateController = TextEditingController();
//   TextEditingController jobController = TextEditingController();
//   TextEditingController monthlyIncomeController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController aboutController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     final EditProfilePageController controller =
//         Get.put(EditProfilePageController(widget.data), permanent: false);
//     Get.put(
//       DropdownController(
//           ['Single', 'Married', 'Divorced', 'Widowed', 'Separated']),
//       tag: 'maritalStatus',
//     );

//     Get.put(
//       DropdownController([
//         'Under 800 KD',
//         'Between 800 - 1499 KD',
//         'Between 1500 - 3000 KD',
//         'Over 3000 KD',
//       ]),
//       tag: 'monthlyIncome',
//     );
//     Get.put(
//       DropdownController([
//         'Kuwait',
//         'USA',
//       ]),
//       tag: 'nationality',
//     );
//     return Scaffold(
//       backgroundColor: AppColor.whiteColor,
//       appBar: AppBar(
//         title: commonText("Edit Information".tr,
//             size: 16, isBold: true, color: AppColor.blackColor),
//         centerTitle: true,
//         backgroundColor: AppColor.primaryColorLight2,
//         foregroundColor: AppColor.blackColor,
//         surfaceTintColor: Colors.transparent,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(colors: [
//             AppColor.primaryColorLight2,
//             AppColor.whiteColor,
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(24),
//             bottomRight: Radius.circular(24),
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Center(
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundImage: NetworkImage(DummyImage.networkImage),
//                       onBackgroundImageError: (exception, stackTrace) {
//                         log('Failed to load image: $exception');
//                       },
//                       child: Icon(
//                         Icons.camera_alt_outlined,
//                         color: Colors.white.withOpacity(0.8),
//                         size: 30,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   commonTextfieldWithTitle(
//                     "Name".tr,
//                     nameController,
//                   ),
//                   const SizedBox(height: 20),
//                   commonTextfieldWithTitle(
//                     "Email".tr,
//                     emailController,
//                   ),
//                   const SizedBox(height: 20),
//                   commonText("Phone Number".tr, size: 14),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 10.0, vertical: 0),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           border: Border.all(
//                             color: AppColor.darkGreyColor,
//                             width: 1.0,
//                           ),
//                         ),
//                         child: DropdownButtonHideUnderline(
//                           child: Obx(
//                             () => DropdownButton<String>(
//                               value: phoneController.selectedCountryCode.value,
//                               onChanged: (String? newValue) {
//                                 phoneController.selectCountryCode(newValue!);
//                               },
//                               items: countryCodes.keys
//                                   .map<DropdownMenuItem<String>>(
//                                       (String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Row(
//                                     children: [
//                                       Image.network(
//                                         countryCodes[value]!,
//                                         width: 24,
//                                         height: 24,
//                                       ),
//                                       const SizedBox(width: 8),
//                                       commonText(value),
//                                     ],
//                                   ),
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       Expanded(
//                         child: commonTextfield(numberController,
//                             hintText: "Phone Number".tr,
//                             keyboardType: TextInputType.number,
//                             borderColor: AppColor.darkGreyColor),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   commonText("Nationality".tr, size: 14),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   CustomDropdown(
//                       controller: Get.find(tag: 'nationality'),
//                       hintText: "Select your nationality".tr),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   commonText("Marital Status".tr, size: 14),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   CustomDropdown(
//                       controller: Get.find(tag: 'maritalStatus'),
//                       hintText: "Select your marital status".tr),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   commonTextfieldWithTitle("Job".tr, jobController,
//                       hintText: "Enter your job title".tr,
//                       keyboardType: TextInputType.visiblePassword),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   commonText("Monthly Income".tr, size: 14),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   CustomDropdown(
//                     controller: Get.find(tag: 'monthlyIncome'),
//                     hintText: "Select your income bracket".tr,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   commonTextfieldWithTitle("About".tr, aboutController,
//                       hintText: "Tell us more about you".tr,
//                       keyboardType: TextInputType.visiblePassword),
//                   const SizedBox(height: 40),
//                   commonButton("Update".tr)
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget buildRadioButton(String role) {
//   //   return Obx(
//   //     () => Row(
//   //       children: [
//   //         Radio<String>(
//   //           value: role,
//   //           groupValue: controller.selectedGender.value,
//   //           onChanged: (String? value) {
//   //             controller.selectRole(value!);
//   //           },
//   //           activeColor: Colors.orange,
//   //         ),
//   //         commonText(
//   //           role,
//   //           color: role == controller.selectedGender.value
//   //               ? Colors.orange
//   //               : Colors.black,
//   //           isBold: role == controller.selectedGender.value ? true : false,
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
