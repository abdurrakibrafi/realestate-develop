import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_dropdown.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/host/editResidenceScreens/edit_property_2.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';

class EditPropertyPage extends StatefulWidget {
  EditPropertyPage({super.key});

  @override
  State<EditPropertyPage> createState() => _EditPropertyPageState();
}

class _EditPropertyPageState extends State<EditPropertyPage> {
  final List<String> photoUrls = [
    DummyImage.networkImage,
    DummyImage.networkImage,
    DummyImage.networkImage,
    DummyImage.networkImage,
    DummyImage.networkImage,
  ];

  final List<String> videoUrls = [
    DummyImage.networkImage,
    DummyImage.networkImage,
  ];

  String residenceType = "Condominium";

  String rentingType = "Long Term";

  int bathrooms = 2;

  int bedrooms = 3;
  @override
  Widget build(BuildContext context) {
    Get.put(
      DropdownController(['Single', 'dobule']),
      tag: 'Property Type',
    );
    Get.put(
      DropdownController(['large', 'small']),
      tag: 'Property Features',
    );
    return Scaffold(
      appBar: AppBar(
        title: commonText("Edit Property".tr, size: 18),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(context, "Your Photo"),
              const SizedBox(height: 10),
              _buildPhotoGrid(),
              const SizedBox(height: 20),
              _buildSectionHeader(context, "Your Video"),
              const SizedBox(height: 10),
              _buildVideoGrid(),
              const SizedBox(height: 20),
              _buildSectionHeader(context, "Property Information"),
              const SizedBox(height: 10),
              Row(
                children: [
                  commonText("Property Type", size: 14, isBold: true),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                  controller: Get.find(tag: 'Property Type'),
                  hintText: "Select property type".tr),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 10),
              _buildparaText("Property Name", "Sunset Ridge"),
              const SizedBox(height: 10),
              _buildparaText("Property Size (Square Meters)", "135 m2"),
              const SizedBox(height: 20),
              Row(
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
                              setState(() {
                                bathrooms--;
                              });
                            },
                            icon: Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: AppColor.blackColor)),
                                child:
                                    const FittedBox(child: Icon(Icons.remove))),
                            color: Colors.black,
                          ),
                          commonText(bathrooms.toString(),
                              size: 16, isBold: true),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bathrooms++;
                              });
                            },
                            icon: Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: AppColor.blackColor)),
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
                              setState(() {
                                bedrooms--;
                              });
                            },
                            icon: Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: AppColor.blackColor)),
                                child: const FittedBox(
                                    child: Icon(
                                  Icons.remove,
                                ))),
                            color: Colors.black,
                          ),
                          commonText(bedrooms.toString(),
                              size: 16, isBold: true),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                bedrooms++;
                              });
                            },
                            icon: Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1, color: AppColor.blackColor)),
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
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  commonText("Property Features", size: 14, isBold: true),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                  controller: Get.find(tag: 'Property Features'),
                  hintText: "Select features".tr),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20),
              RadioGroup(
                groupName: "Residence Type",
                options: const ["Condominium", "Private"],
                selectedValue: residenceType,
                onChanged: (value) {
                  setState(() {
                    residenceType = value;
                  });
                },
              ),
              RadioGroup(
                groupName: "Renting Type",
                options: const ["Short Term", "Long Term"],
                selectedValue: rentingType,
                onChanged: (value) {
                  setState(() {
                    rentingType = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20),
              _buildparaText("Rent Per Night (if applicable)", "K.D 60/Night"),
              const SizedBox(height: 10),
              _buildparaText("Rent Per Month", "K.D 360/Month"),
              const SizedBox(height: 20),
              _buildparaText(
                "About Residence",
                "This delightful residence boasts a blend of classic charm and modern conveniences, nestled in a serene neighborhood. The interiors are beautifully appointed with high-quality finishes and thoughtful details.",
              ),
              const SizedBox(height: 30),
              commonButton(
                "Next",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditPropertyPage2ndPage(),
                      ));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        commonText(title, size: 16, isBold: true),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: AppColor.primaryColor),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.edit,
                size: 16,
              ),
              const SizedBox(width: 4),
              commonText(
                "Edit",
                size: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoGrid() {
    return SizedBox(
      height: 172,
      child: Row(
        children: [
          if (photoUrls.isNotEmpty)
            Expanded(
                child: Container(
              height: 172,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(photoUrls[0]))),
            )),
          Expanded(
            child: Column(
              children: [
                if (photoUrls.length > 1)
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 8.0, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(photoUrls[1]))),
                  )),
                if (photoUrls.length > 2)
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 8.0, top: 4),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(photoUrls[2]))),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45,
                          ),
                          child: Center(
                            child: commonText("3+",
                                size: 21, color: AppColor.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildVideoGrid() {
    return SizedBox(
      height: 172,
      child: Row(
        children: [
          if (videoUrls.isNotEmpty)
            Expanded(
                child: Container(
              height: 172,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(videoUrls[0]))),
            )),
          Expanded(
            child: Column(
              children: [
                if (videoUrls.length > 1)
                  Expanded(
                      child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 8.0, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(videoUrls[1]))),
                  )),
                if (videoUrls.length > 2)
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 8.0, top: 4),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(videoUrls[2]))),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black45,
                          ),
                          child: Center(
                            child: commonText("3+",
                                size: 21, color: AppColor.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildparaText(String label, String subtext, {int maxLines = 1}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(label, size: 16, isBold: true),
        SizedBox(
          height: 10,
        ),
        commonText(subtext, size: 16, color: Colors.grey),
      ],
    );
  }
}

class RadioGroup extends StatelessWidget {
  final String groupName;
  final List<String> options;
  final String selectedValue;
  final Function(String) onChanged;

  const RadioGroup({
    Key? key,
    required this.groupName,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

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
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

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
