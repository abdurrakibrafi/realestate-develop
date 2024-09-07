// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate_management/res/components/common_text.dart';
// import 'package:real_estate_management/res/colors/colors.dart';
// import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';
// import 'package:real_estate_management/viewModel/controllers/homeControllers/filter_controller.dart';

// Widget customDrawer(BuildContext context,
//     {VoidCallback? onTap, Function? onResetTap}) {
//   final FilterController controller = Get.put(FilterController());

//   return Drawer(
//     backgroundColor: AppColor.whiteColor,
//     surfaceTintColor: Colors.transparent,
//     elevation: 16.0,
//     child: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Property Type
//             commonText("Property Type".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: controller.propertyTypes
//                       .where((type) => !type.isDeleted)
//                       .map((type) => customBox(type))
//                       .toList(),
//                 )),
//             const SizedBox(height: 20),

//             // Budget
//             commonText("Budget".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => RangeSlider(
//                   values: controller.budgetRange.value,
//                   min: 0,
//                   max: 100000,
//                   divisions: 100000,
//                   labels: RangeLabels(
//                     '${controller.budgetRange.value.start.toStringAsFixed(1)} K.D',
//                     '${controller.budgetRange.value.end.toStringAsFixed(1)} K.D',
//                   ),
//                   onChanged: (RangeValues values) {
//                     controller.budgetRange.value = values;
//                   },
//                   activeColor: AppColor.primaryColor,
//                   inactiveColor:
//                       Colors.grey[300], // Adjust the color to match your theme
//                 )),
//             const SizedBox(height: 20),

//             // Rooms
//             commonText("Rooms".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: [1, 2, 3, 4, 5, 6]
//                       .map((room) => customRoomBox(
//                           room, controller.selectedRooms.value == room))
//                       .toList(),
//                 )),
//             const SizedBox(height: 20),

//             // Duration of Stay
//             commonText("Renting Type".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: ['Short Term', 'Long Term']
//                       .map((dur) => customDurationBox(
//                           dur, controller.duration.value == dur))
//                       .toList(),
//                 )),
//             const SizedBox(height: 20),

//             // Residence
//             commonText("Residence".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: ['Private Residence', 'Condominium']
//                       .map((res) => customResidenceBox(
//                           res, controller.residence.value == res))
//                       .toList(),
//                 )),
//             const SizedBox(height: 20),

//             // Features
//             commonText("Features".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: controller.features
//                       .where((feature) => !feature.isDeleted)
//                       .map((feature) => customBox(feature, isFeature: true))
//                       .toList(),
//                 )),
//             const SizedBox(height: 20),

//             // Governorate
//             commonText("Governorate".tr, size: 16, isBold: true),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: [
//                     'Kuwait City',
//                     'Hawalli',
//                     'Farwaniya',
//                     'Ahmadi',
//                     'Jahra'
//                   ]
//                       .map((gov) => customGovernorateBox(
//                           gov, controller.governorate.value == gov))
//                       .toList(),
//                 )),
//             const SizedBox(height: 15),
//             SizedBox(
//               height: 40,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: () {
//                         for (var property in controller.propertyTypes) {
//                           property.isSelected.value = false;
//                         }

//                         controller.budgetRange.value =
//                             const RangeValues(0, 100000);
//                         controller.selectedRooms.value = 0;

//                         controller.duration.value = "";
//                         controller.residence.value = "";
//                         controller.features.clear();
//                         controller.governorate.value = "";
//                         onResetTap!();
//                         Navigator.pop(context);
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 8),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 1, color: AppColor.primaryColor),
//                           borderRadius:
//                               const BorderRadius.all(Radius.circular(50)),
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Icon(Icons.replay_outlined),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                                 commonText("Reset all",
//                                     isBold: true, color: AppColor.primaryColor),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: GestureDetector(
//                       onTap: onTap,
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 8),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(50)),
//                           color: AppColor.primaryColor,
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: commonText("Apply",
//                                 isBold: true, color: AppColor.whiteColor),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget customBox(PropertyType property, {bool isFeature = false}) {
//   return Obx(() => GestureDetector(
//         onTap: () {
//           if (isFeature) {
//             Get.find<FilterController>().toggleFeatureSelection(property);
//           } else {
//             Get.find<FilterController>().togglePropertySelection(property);
//           }
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(50),
//             color: property.isSelected.value
//                 ? Colors.amber.shade50
//                 : const Color(0xFFF2F2F3),
//           ),
//           child: commonText(
//             property.name.tr,
//             size: 12,
//             color:
//                 property.isSelected.value ? AppColor.primaryColor : Colors.grey,
//           ),
//         ),
//       ));
// }

// Widget customRoomBox(int room, bool isSelected) {
//   return GestureDetector(
//     onTap: () {
//       Get.find<FilterController>().selectedRooms.value = room;
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
//       ),
//       child: commonText(
//         room.toString().padLeft(2, '0'),
//         size: 12,
//         color: isSelected ? AppColor.primaryColor : Colors.grey,
//       ),
//     ),
//   );
// }

// Widget customDurationBox(String duration, bool isSelected) {
//   return GestureDetector(
//     onTap: () {
//       Get.find<FilterController>().duration.value = duration;
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
//       ),
//       child: commonText(
//         duration,
//         size: 12,
//         color: isSelected ? AppColor.primaryColor : Colors.grey,
//       ),
//     ),
//   );
// }

// Widget customResidenceBox(String residence, bool isSelected) {
//   return GestureDetector(
//     onTap: () {
//       Get.find<FilterController>().residence.value = residence;
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
//       ),
//       child: commonText(
//         residence,
//         size: 12,
//         color: isSelected ? AppColor.primaryColor : Colors.grey,
//       ),
//     ),
//   );
// }

// Widget customApartmentTypeBox(String type, bool isSelected) {
//   return GestureDetector(
//     onTap: () {
//       Get.find<FilterController>().apartmentType.value = type;
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
//       ),
//       child: commonText(
//         type,
//         size: 12,
//         color: isSelected ? AppColor.primaryColor : Colors.grey,
//       ),
//     ),
//   );
// }

// Widget customGovernorateBox(String gov, bool isSelected) {
//   return GestureDetector(
//     onTap: () {
//       Get.find<FilterController>().governorate.value = gov;
//     },
//     child: Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         color: isSelected ? Colors.amber.shade50 : const Color(0xFFF2F2F3),
//       ),
//       child: commonText(
//         gov,
//         size: 12,
//         color: isSelected ? AppColor.primaryColor : Colors.grey,
//       ),
//     ),
//   );
// }






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:real_estate_management/res/components/common_button.dart';
// import 'package:real_estate_management/res/components/common_text.dart';
// import 'package:real_estate_management/res/colors/colors.dart';
// import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';
// import 'package:real_estate_management/viewModel/controllers/homeControllers/filter_controller.dart';

// Widget customDrawer(BuildContext context, {VoidCallback? onTap}) {
//   return Drawer(
//     backgroundColor: AppColor.whiteColor,
//     surfaceTintColor: Colors.transparent,
//     elevation: 16.0,
//     child: SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 commonText("Filter".tr, size: 16),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Image.asset("assets/icons/closeIcon.png")),
//               ],
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             commonText("Property Type".tr, size: 16),
//             const Divider(),
//             Obx(() => Wrap(
//                   spacing: 8.0,
//                   runSpacing: 8.0,
//                   children: Get.put(FilterController())
//                       .propertyTypes
//                       .where((type) => !type.isDeleted)
//                       .map((type) => customBox(type))
//                       .toList(),
//                 )),
//             const SizedBox(
//               height: 20,
//             ),
//             commonText("Number of Rooms".tr, size: 16),
//             const Divider(),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: [
//                 customBox2("1".tr),
//                 customBox2("2".tr),
//                 customBox2("3".tr),
//                 customBox2("4".tr),
//                 customBox2("5".tr),
//                 customBox2("6".tr),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             commonText("Lease Term".tr, size: 16),
//             const Divider(),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 8.0,
//               children: [
//                 customBox2("Daily".tr),
//                 customBox2("Monthly".tr),
//                 customBox2("Yearly".tr),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             commonText("Budget".tr, size: 16),
//             const Divider(),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 buildRadioButton('\$10 - \$50'),
//                 buildRadioButton('\$60 - \$100'),
//                 buildRadioButton('\$110 - \$150'),
//                 buildRadioButton('\$160 - \$200'),
//                 buildRadioButton('\$210 - \$250'),
//               ],
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             commonButton("Apply".tr, onTap: onTap)
//           ],
//         ),
//       ),
//     ),
//   );
// }

// Widget customBox2(String text) {
//   return Container(
//     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//     decoration: BoxDecoration(
//       border: Border.all(
//         color: AppColor.primaryColor,
//         width: 1,
//       ),
//       borderRadius: BorderRadius.circular(4),
//     ),
//     child: commonText(text, size: 12, color: AppColor.primaryColor),
//   );
// }

// Widget customBox(PropertyType property) {
//   return Obx(() => GestureDetector(
//         onTap: () {
//           Get.find<FilterController>().togglePropertySelection(property);
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: property.isSelected.value
//                   ? AppColor.primaryColor
//                   : AppColor.primaryColor,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(4),
//             color: property.isSelected.value
//                 ? AppColor.primaryColor
//                 : AppColor.whiteColor,
//           ),
//           child: commonText(
//             property.name.tr,
//             size: 12,
//             color: property.isSelected.value
//                 ? AppColor.whiteColor
//                 : AppColor.primaryColor,
//           ),
//         ),
//       ));
// }

// String _selectedRole = '\$10 - \$50';
// Widget buildRadioButton(String role) {
//   return Row(
//     children: [
//       Radio<String>(
//         value: role,
//         groupValue: _selectedRole,
//         onChanged: (String? value) {
//           _selectedRole = value!;
//         },
//         activeColor: Colors.orange,
//       ),
//       commonText(
//         role,
//       ),
//     ],
//   );
// }
