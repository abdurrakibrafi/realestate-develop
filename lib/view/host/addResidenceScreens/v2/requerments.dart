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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                certificate["label"],
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColor.blackColor,
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
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
                height: 16,
              ),
              Obx(() {
                return RadioGroup(
                  groupName: "Payment Type",
                  options: const ["Per Night", "Per Month"],
                  selectedValue: controller.paymentType.value,
                  onChanged: (value) {
                    controller.paymentType.value = value;
                  },
                );
              }),
              commonTextfieldWithTitle(
                "Deposite (if applicable)".tr,
                controller.depositeController,
                hintText: "Enter deposite amount".tr,
                  keyboardType: TextInputType.number
              ),
              const SizedBox(height: 20),
              commonTextfieldWithTitle(
                "Rent".tr,
                controller.rentController,
                hintText: "Enter rent amount".tr,
                keyboardType: TextInputType.number
              ),
              buildCertificateToggleList(),
              const SizedBox(
                height: 20,
              ),
              commonButton(
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
