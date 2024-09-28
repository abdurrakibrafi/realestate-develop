import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/models/residencesModels/residences_model.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/videoPlayer/video_player.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/feature_page.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';
import 'package:real_estate_management/viewModel/controllers/dropdown_controller.dart';

class AddResidencePage extends StatefulWidget {
  final bool isEdit;
  final AllResidence? data;
  const AddResidencePage({super.key, required this.isEdit, this.data});

  @override
  State<AddResidencePage> createState() => _AddResidencePageState();
}

class _AddResidencePageState extends State<AddResidencePage> {
  // final TextEditingController propertyNameController = TextEditingController();

  // final TextEditingController squareFeetController = TextEditingController();

  // final TextEditingController rentPerMonthController = TextEditingController();
  // final TextEditingController rentPerNightController = TextEditingController();
  // String residenceType = "Condominium";

  // int bathrooms = 2;
  // int bedrooms = 3;
  final controller = Get.put(AddResidenceController());

  @override
  void initState() {
    if (widget.isEdit) {
      controller.residenceId.value = widget.data!.sId!;
      controller.selectRole(widget.data!.category!.sId!);
      controller.propertyNameController.text = widget.data!.propertyName!;
      controller.squareFeetController.text = widget.data!.squareFeet!;
      controller.bathrooms.value = int.parse(widget.data!.bathrooms!);
      controller.grace.value = int.parse(widget.data!.grace!);
      controller.bedrooms.value = int.parse(widget.data!.bedrooms!);
      controller.residenceType.value = widget.data!.residenceType!;
      controller.aboutPropertyController.text = widget.data!.propertyAbout!;
      // controller.selectedFeatures = widget.data!.features!.toSet().obs;
      // controller.selectedFeatures.addAll(widget.data!.features!);
      for (var feature in widget.data!.features!) {
        controller.selectedFeatures.add(feature.trim());
      }
      controller.rentingType.value = widget.data!.rentType!;
      controller.paymentType.value = widget.data!.paymentType!;
      controller.depositeController.text = widget.data!.deposit!.toString();
      controller.rentController.text = widget.data!.rent!.toString();
      controller.certificates[0]["isEnabled"] =
          widget.data!.document!.marriageCertificate!;
      controller.certificates[1]["isEnabled"] =
      widget.data!.document!.criminalStatusCertificate!;
      controller.certificates[2]["isEnabled"] =
          widget.data!.document!.salaryCertificate!;
      controller.certificates[3]["isEnabled"] =
          widget.data!.document!.bankStatement!;
      controller.certificates[4]["isEnabled"] =
          widget.data!.document!.passport!;
      controller.selectedgovernorate.value = widget.data!.address!.governorate!;
      controller.selectedarea.value = widget.data!.address!.area!;
      controller.selectedgovernorate.value = widget.data!.address!.governorate!;
      controller.selectedgovernorate.value = widget.data!.address!.governorate!;
      controller.houseController.text = widget.data!.address!.house!;
      controller.apartmentController.text = widget.data!.address!.apartment!;
      controller.floorController.text = widget.data!.address!.floor!;
      controller.streetController.text = widget.data!.address!.street!;
      controller.blockController.text = widget.data!.address!.block!;
      controller.avenueController.text = widget.data!.address!.avenue!;
      controller.aditionalController.text =
          widget.data!.address!.additionalDirections!;
      controller.images.value = widget.data!.images!;
      controller.videos.value = widget.data!.videos!;
    }

    super.initState();
  }

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
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText(widget.isEdit ? "Edit Residence" : "Add Residences".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              commonText("1", color: AppColor.primaryColor),
              commonText("/4"),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
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

                          ? Stack (
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
                                  itemCount: controller.pickedImages.length,
                                  itemBuilder: (context, index) {
                                    return Image.file(
                                      controller.pickedImages[index],
                                      fit: BoxFit.cover,
                                    );
                                  },

                                ),
                              Positioned(
                                  top: 0,
                                  right:0,
                                  child: InkWell(
                                      onTap: (){
                                        controller.pickedImages.clear();
                                      },
                                      child: Icon(Icons.clear)))
                            ],
                          ) : controller.images.isNotEmpty
                          ? Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                            ),
                            itemCount: controller.images.length,
                            itemBuilder: (context, index) {
                              return Image.network(controller.images[index].url.toString());
                            },
                          ),
                          SizedBox(height: 10,),
                          commonButton(
                            "Clear Images".tr,
                            onTap: () {
                              controller.images.clear();
                            },
                          )
                        ],
                      )
                          :  DottedBorder(
                                  borderType: BorderType.RRect,
                                  dashPattern: const [7, 7],
                                  color: AppColor.primaryColor,
                                  strokeWidth: 1,
                                  borderPadding: const EdgeInsets.all(0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue.shade50),
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
                                        commonText("Max. 10 files, 10 MB each".tr,
                                            color: Colors.grey),
                                        commonIconButton("Upload".tr,
                                            icon: Image.asset(
                                                "assets/icons/export.png"),
                                            color: Colors.black87,
                                            height: 40,
                                            textSize: 16,
                                            onTap: () =>
                                                controller.pickImages()),
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  ),
                                );
                    })),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Obx(() {
                    return controller.pickedVideos.isNotEmpty
                        ? Column(
                            children: [
                              GridView.builder(
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
                                    isEdit: widget.isEdit,
                                  );
                                },
                              ),
                              SizedBox(height: 10,),
                              commonButton(
                                "Clear Videos".tr,
                                onTap: () {
                                  controller.pickedVideos.clear();
                                },
                              )
                            ],
                          )
                        : controller.videos.isNotEmpty
                            ? Column(
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                    ),
                                    itemCount: controller.videos.length,
                                    itemBuilder: (context, index) {
                                      return VideoPlayerWidget(
                                        isEdit: widget.isEdit,
                                        videoUrl: controller.videos[index].url,
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10,),
                                  commonButton(
                                    "Clear Videos".tr,
                                    onTap: () {
                                      controller.videos.clear();
                                    },
                                  )
                                ],
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
                                      commonText("Max. 5 files, 10 MB each".tr,
                                          color: Colors.grey),
                                      commonIconButton("Upload".tr,
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
                    commonText("Property Type".tr, size: 14.0, isBold: true),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(() => GridView.builder(
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
                  "Property Size".tr,
                  controller.squareFeetController,
                  hintText: "Size in Sqm".tr,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        commonText("Bathrooms".tr, size: 14.0, isBold: true),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (controller.bathrooms.value >= 2) {
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
                            Obx(() {
                              return commonText(controller.bathrooms.toString(),
                                  size: 16.0, isBold: true);
                            }),
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
                        commonText("Bedrooms".tr, size: 14.0, isBold: true),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (controller.bedrooms.value >= 2) {
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
                            Obx(() {
                              return commonText(controller.bedrooms.toString(),
                                  size: 16.0, isBold: true);
                            }),
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
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Row(
                //   children: [
                //     commonText("Property Features", size: 14, isBold: true),
                //   ],
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                // CustomDropdown(
                //     controller: Get.find(tag: 'Property Features'),
                //     hintText: "Select amenities".tr),
                // const SizedBox(
                //   height: 20,
                // ),
                Obx(() {
                  return RadioGroup(
                    groupName: "Residence Type".tr,
                    options:  ["Condominium".tr, "Private".tr],
                    selectedValue: controller.residenceType.value,
                    onChanged: (value) {
                      controller.residenceType.value = value;
                    },
                  );
                }),
                // RadioGroup(
                //   groupName: "Renting Type",
                //   options: const ["Short Term", "Long Term"],
                //   selectedValue: rentingType,
                //   onChanged: (value) {
                //     setState(() {
                //       rentingType = value;
                //     });
                //   },
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // commonTextfieldWithTitle(
                //   "Rent Per Night (if applicable)".tr,
                //   rentPerNightController,
                //   hintText: "35 K.D / Night".tr,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // commonTextfieldWithTitle(
                //   "Rent Per Month".tr,
                //   rentPerMonthController,
                //   hintText: "357 K.D / Month".tr,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // commonTextfieldWithTitle(
                //   "About Residence".tr,
                //   aboutPropertyController,
                //   borderradious: 10,
                //   hintText: "Tell us about your Property".tr,
                //   maxLine: 4,
                // ),
                // const SizedBox(height: 20),
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
                                FeaturePage(isEdit: widget.isEdit)),
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
              role.tr,
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
        commonText(groupName, isBold: true, size: 16.0),
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
            isSelected
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_sharp,
            color: isSelected ? Colors.orange : Colors.black,
          ),
          const SizedBox(
            width: 5,
          ),
          commonText(label, size: 16),
        ],
      ),
    );
  }
}
