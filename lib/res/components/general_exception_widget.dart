import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralExceptionWidget> createState() => _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * .15,
            ),
            const Icon(
              Icons.cloud_off,
              color: AppColor.primaryColor,
              size: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child:
                  Center(child: commonText("general_exception".tr, size: 14,textAlign: TextAlign.center)),
            ),
            SizedBox(
              height: height * .15,
            ),
            commonButton("Retry", onTap: widget.onPress)
          ],
        ),
      ),
    );
  }
}
