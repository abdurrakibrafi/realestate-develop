import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/v2/add_residence_second_page.dart';
import 'package:real_estate_management/viewModel/controllers/addResidenceControllers/add_residence_controller.dart';

class RequermentsPage extends StatefulWidget {
  final bool isEdit;
  const RequermentsPage({super.key, required this.isEdit});

  @override
  State<RequermentsPage> createState() => _RequermentsPageState();
}

class _RequermentsPageState extends State<RequermentsPage> {
  final controller = Get.find<AddResidenceController>();

  String rentingType = "Long Term";
  String paymentType = "Per Month";

  String dropdownValue = 'Monthly';

  // List to manage the state of the toggles

  // void _toggleSwitch(int index, bool value) {
  //   setState(() {
  //     controller.certificates[index]["isEnabled"] = value;
  //   });
  // }

  Widget buildCertificateToggleList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: controller.certificates.asMap().entries.map((entry) {
        int index = entry.key;
        Map<String, dynamic> certificate = entry.value;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                certificate["label"].toString().tr,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColor.darkGreyColor,
                ),
              ),
              Switch(
                value: certificate["isEnabled"],
                onChanged: (bool value) {
                  setState(() {
                    controller.certificates[index]["isEnabled"] = value;
                  });
                },
                activeColor: AppColor.whiteColor,
                focusColor: Colors.black,
                activeTrackColor: AppColor.primaryColor,
                inactiveThumbColor: Colors.grey.shade600,
                inactiveTrackColor: AppColor.whiteColor,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Requirements".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: Colors.transparent,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              commonText("3", color: AppColor.primaryColor),
              commonText("/4"),
              const SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("Rent".tr, size: 16, isBold: true),
              const SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 48,
                    width: 155,
                    decoration: BoxDecoration(
                      color: const Color(0xffFCFCFC),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: const Color(0xffD7D7D7),
                        width: 1.0,
                      ),
                    ),
                    child: TextFormField(
                      controller:  controller.rentController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "450 K.D",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          color: AppColor.darkGreyColor,
                        ),
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryColor, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 0, // Remove the default underline
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          print(dropdownValue);
                        });
                      },
                      items: <String>['Monthly', 'Per Night']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              /*Obx(() {
                return RadioGroup(
                  groupName: "Renting Type".tr,
                  options:  ["Short Term".tr, "Long Term".tr],
                  selectedValue: controller.rentingType.value,
                  onChanged: (value) {
                    controller.rentingType.value = value;
                  },
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Obx(() {
                return RadioGroup(
                  groupName: "Payment Type".tr,
                  options:  ["Per Night".tr, "Per Month".tr],
                  selectedValue: controller.paymentType.value,
                  onChanged: (value) {
                    controller.paymentType.value = value;
                  },
                );
              }),*/
          SizedBox(
            width: 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText("Deposite (if applicable)".tr, size: 16, isBold: true),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 48,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xffFCFCFC),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(0xffD7D7D7),
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    controller:  controller.depositeController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "150 K.D",
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColor.darkGreyColor,
                      ),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
            /*  commonTextfieldWithTitle(
                "Deposite (if applicable)".tr,
                controller.depositeController,
                hintText: "Enter deposite amount".tr,
                  keyboardType: TextInputType.number
              ),*/
           //   const SizedBox(height: 20),
             /* commonTextfieldWithTitle(
                "Rent".tr,
                controller.rentController,
                hintText: "150 K.D".tr,
                keyboardType: TextInputType.number
              ),*/
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("Grace Period (if applicable)".tr, size: 16.0, isBold: true),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (controller.grace.value >= 2) {
                                controller.grace--;
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
                            return commonText(controller.grace.toString(),
                                size: 16.0, isBold: true);
                          }),
                          IconButton(
                            onPressed: () {
                              controller.grace++;
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
                      const SizedBox(
                        width: 30,
                      ),
                      commonText("$dropdownValue",isBold: true,size: 16)
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              commonText("Required Documents".tr,isBold: true,size: 16),
              buildCertificateToggleList(),
              const SizedBox(
                height: 20,
              ),
             /* commonButton(
                "Next".tr,
                onTap: () {
                  if (controller.validateRequirementPage()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddResidenceSecondPage(
                                isEdit: widget.isEdit,
                              )),
                    );
                  }
                },
              ),*/

              GestureDetector(
                onTap: () {
                  if (controller.validateRequirementPage()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddResidenceSecondPage(
                            isEdit: widget.isEdit,
                          )),
                    );
                  }
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: AppColor.primaryColor,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: commonText("Next".tr,
                          size: 16, color: Colors.white, isBold: true),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget textField(
    String title, TextEditingController controller, String hinttext) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      commonText(title, size: 14, isBold: true),
      const SizedBox(
        height: 10,
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey,
            width: 0.50,
          ),
        ),
        child: TextFormField(
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12.0),
            hintText: hinttext,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColor.darkGreyColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );
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
            isSelected
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_sharp,
            color: isSelected ? Colors.orange : AppColor.blackColor,
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
