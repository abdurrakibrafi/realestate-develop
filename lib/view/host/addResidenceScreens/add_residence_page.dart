import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/videoPlayer/video_player.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/add_residence_second_page.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class AddResidencePage extends StatefulWidget {
  final bool isEdit;
  const AddResidencePage({super.key, required this.isEdit});

  @override
  State<AddResidencePage> createState() => _AddResidencePageState();
}

class _AddResidencePageState extends State<AddResidencePage> {
  // final TextEditingController propertyNameController = TextEditingController();
  // final TextEditingController aboutPropertyController = TextEditingController();
  // final TextEditingController squareFeetController = TextEditingController();

  final controller = Get.put(AddResidenceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Add Residences".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Obx(() {
                    return controller.pickedImages.isNotEmpty
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: controller.pickedImages.length,
                            itemBuilder: (context, index) {
                              return Image.file(
                                controller.pickedImages[index],
                                fit: BoxFit.cover,
                              );
                            },
                          )
                        : DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: const [7, 7],
                            color: AppColor.primaryColor,
                            strokeWidth: 1,
                            borderPadding: const EdgeInsets.all(0),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.blue.shade50),
                              width: double.infinity,
                              height: 220,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(height: 10),
                                  const CircleAvatar(
                                    backgroundColor: Colors.black87,
                                    radius: 24,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.red,
                                    ),
                                  ),
                                  commonText("Photos".tr,
                                      size: 14, isBold: true),
                                  commonText("Max. 10 files, 10 MB each",
                                      color: Colors.grey),
                                  commonIconButton("Upload",
                                      icon: Image.asset(
                                          "assets/icons/export.png"),
                                      color: Colors.black87,
                                      height: 40,
                                      textSize: 16,
                                      onTap: () => controller.pickImages()),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                  }),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Obx(() {
                    return controller.pickedVideos.isNotEmpty
                        ? GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: controller.pickedVideos.length,
                            itemBuilder: (context, index) {
                              return VideoPlayerWidget(
                                videoFile: controller.pickedVideos[index],
                                isEdit: false,
                              );
                            },
                          )
                        : DottedBorder(
                            borderType: BorderType.RRect,
                            dashPattern: const [7, 7],
                            color: AppColor.primaryColor,
                            strokeWidth: 1,
                            borderPadding: const EdgeInsets.all(0),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Colors.blue.shade50),
                              width: double.infinity,
                              height: 220,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(height: 10),
                                  CircleAvatar(
                                    backgroundColor: Colors.black87,
                                    radius: 24,
                                    child: Image.asset(
                                        "assets/images/addListening/video.png"),
                                  ),
                                  commonText("Videos".tr,
                                      size: 14, isBold: true),
                                  commonText("Max. 5 files, 10 MB each",
                                      color: Colors.grey),
                                  commonIconButton("Upload",
                                      icon: Image.asset(
                                          "assets/icons/export.png"),
                                      color: Colors.black87,
                                      height: 40,
                                      textSize: 16,
                                      onTap: () => controller.pickVideos()),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    commonText("Property Type", size: 14, isBold: true),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
               Obx(() =>  GridView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                   childAspectRatio: 3,
                 ),
                 itemCount: controller.categoryList.length,
                 itemBuilder: (context, index) {
                   final propertyType = controller.categoryList[index];
                   if (propertyType.isDeleted == false) {
                     return buildRadioButton(
                         propertyType.name.toString(), propertyType.id.toString());
                   }
                   return Container(); // Return empty container for deleted items
                 },
               ),),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                  "Property Title".tr,
                  controller.propertyNameController,
                  hintText: "Choose an eye-catching title".tr,
                ),
                const SizedBox(height: 20),
                commonTextfieldWithTitle(
                  "Property Size (Square Meters)".tr,
                  controller.squareFeetController,
                  hintText: "Enter residence size".tr,
                  keyboardType: TextInputType.number
                ),
                const SizedBox(height: 20),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          commonText("Bathrooms", size: 14, isBold: true),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (controller.bathrooms.value >= 1) {
                                    controller.bathrooms--;
                                  }
                                },
                                icon: Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.blackColor)),
                                    child: const FittedBox(
                                        child: Icon(Icons.remove))),
                                color: Colors.black,
                              ),
                              commonText(controller.bathrooms.toString(),
                                  size: 16, isBold: true),
                              IconButton(
                                onPressed: () {
                                  controller.bathrooms++;
                                },
                                icon: Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.blackColor)),
                                    child: const FittedBox(
                                        child: Icon(
                                      Icons.add,
                                      color: AppColor.primaryColor,
                                    ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          commonText("Bedrooms", size: 14, isBold: true),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (controller.bedrooms.value >= 1) {
                                    controller.bedrooms--;
                                  }
                                },
                                icon: Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.blackColor)),
                                    child: const FittedBox(
                                        child: Icon(
                                      Icons.remove,
                                    ))),
                                color: Colors.black,
                              ),
                              commonText(controller.bedrooms.toString(),
                                  size: 16, isBold: true),
                              IconButton(
                                onPressed: () {
                                  controller.bedrooms++;
                                },
                                icon: Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.blackColor)),
                                    child: const FittedBox(
                                        child: Icon(
                                      Icons.add,
                                      color: AppColor.primaryColor,
                                    ))),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    commonText("Property Features", size: 14, isBold: true),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomDropdown(
                    controller: controller.propertyFeaturesController,
                    hintText: "Select features".tr),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return RadioGroup(
                    groupName: "Residence Type",
                    options: const ["Condominium", "Private"],
                    selectedValue: controller.residenceType.value,
                    onChanged: (value) {
                      controller.residenceType.value = value;
                    },
                  );
                }),
                Obx(() {
                  return RadioGroup(
                    groupName: "Renting Type",
                    options: const ["Short Term", "Long Term"],
                    selectedValue: controller.rentingType.value,
                    onChanged: (value) {
                      controller.rentingType.value = value;
                    },
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                  "Rent Per Night (if applicable)".tr,
                  controller.rentPerNightController,
                  hintText: "35 K.D / Night".tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                  "Rent Per Month".tr,
                  controller.rentPerMonthController,
                  hintText: "357 K.D / Month".tr,
                ),
                const SizedBox(
                  height: 20,
                ),
                commonTextfieldWithTitle(
                  "About Residence".tr,
                  controller.aboutPropertyController,
                  borderradious: 10,
                  hintText: "Tell us about your Property".tr,
                  maxLine: 4,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 30,
                ),
                commonButton(
                  "Next".tr,
                  onTap: () {
                    if (controller.validateFirstPage()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const AddResidenceSecondPage()),
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRadioButton(String role, String id) {
    return Obx(
      () => Row(
        children: [
          Radio<String>(
            value: id,
            groupValue: controller.selectedTypeId.value,
            onChanged: (String? value) {
              controller.selectRole(value!);
            },
            activeColor: Colors.orange,
          ),
          Expanded(
            child: Text(
              role,
              style: TextStyle(
                color: id == controller.selectedTypeId.value
                    ? Colors.orange
                    : Colors.black,
                fontWeight: id == controller.selectedTypeId.value
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioGroup extends StatelessWidget {
  final String groupName;
  final List<String> options;
  final String selectedValue;
  final Function(String) onChanged;

  const RadioGroup({
    super.key,
    required this.groupName,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(groupName, isBold: true, size: 16),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: RadioOption(
                  label: option,
                  isSelected: selectedValue == option,
                  onTap: () => onChanged(option),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class RadioOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;

  const RadioOption({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.orange : Colors.black,
          ),
          commonText(label, size: 16),
        ],
      ),
    );
  }
}
