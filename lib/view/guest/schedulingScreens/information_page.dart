import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/view/guest/paymentScreens/payment_page.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<String> dayList = <String>['1', '2', '3', '4'];
  List<String> monthList = <String>['January', 'February', 'March', 'April'];
  List<String> yearList = <String>['2001', '2002', '2003', '2004'];
  String dayDropdownValue = "";
  String monthDropdownValue = "";
  String yearDropdownValue = "";
  String _selectedRole = 'Male';

  @override
  void initState() {
    super.initState();
    dayDropdownValue = dayList.first;
    monthDropdownValue = monthList.first;
    yearDropdownValue = yearList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Information".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTextfieldWithTitle("Name".tr, nameController,
                        hintText: "Enter your name".tr),
                    const SizedBox(
                      height: 20,
                    ),
                    commonTextfieldWithTitle("Email".tr, emailController,
                        hintText: "Enter your email".tr),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: commonText("Age".tr, size: 14, isBold: true),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        commonDropdown(
                            dropdownValue: dayDropdownValue.tr,
                            list: dayList,
                            onChanged: (String? value) {
                              setState(() {
                                dayDropdownValue = value!;
                              });
                            }),
                        commonDropdown(
                            dropdownValue: monthDropdownValue.tr,
                            list: monthList,
                            onChanged: (String? value) {
                              setState(() {
                                monthDropdownValue = value!;
                              });
                            }),
                        commonDropdown(
                            dropdownValue: yearDropdownValue.tr,
                            list: yearList,
                            onChanged: (String? value) {
                              setState(() {
                                yearDropdownValue = value!;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: commonText("Gender".tr, size: 14, isBold: true),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildRadioButton('Male'.tr),
                        const SizedBox(width: 20),
                        buildRadioButton('Female'.tr),
                        const SizedBox(width: 20),
                        buildRadioButton('Others'.tr),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    commonTextfieldWithTitle(
                        "Phone Number".tr, numberController,
                        hintText: "Enter phone number".tr),
                    const SizedBox(
                      height: 20,
                    ),
                    commonTextfieldWithTitle("Address".tr, addressController,
                        hintText: "Enter your address".tr),
                  ],
                ),
              ),
              const Spacer(),
              commonButton(
                "Submit".tr,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentPage(
                              isGust: true,
                              isHost: true,
                            )),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonTextfieldWithTitle(
    String title,
    TextEditingController controller, {
    String hintText = "",
    TextInputType keyboardType = TextInputType.text,
    String? assetIconPath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: commonText(title, size: 14, isBold: true),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColorLight,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: keyboardType == TextInputType.visiblePassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColor.lightGreyColor),
              border: InputBorder.none,
              prefixIcon: assetIconPath != null
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ImageIcon(
                        AssetImage(assetIconPath),
                        size: 24.0,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget commonDropdown({
    required String dropdownValue,
    required List<String> list,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.primaryColorLight,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButton<String>(
        underline: Container(
          color: Colors.transparent,
        ),
        value: dropdownValue,
        icon: const ImageIcon(
          AssetImage('assets/icons/arrowDownIcon.png'),
        ),
        onChanged: onChanged,
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: commonText(value, size: 13, color: AppColor.darkGreyColor),
          );
        }).toList(),
      ),
    );
  }

  Widget buildRadioButton(String role) {
    return Row(
      children: [
        Radio<String>(
          value: role,
          groupValue: _selectedRole,
          onChanged: (String? value) {
            setState(() {
              _selectedRole = value!;
            });
          },
          activeColor: Colors.orange,
        ),
        commonText(
          role,
          color: role == _selectedRole ? Colors.orange : Colors.black,
          isBold: role == _selectedRole ? true : false,
        ),
      ],
    );
  }
}
