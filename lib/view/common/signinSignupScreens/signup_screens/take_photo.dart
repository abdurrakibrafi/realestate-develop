import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/view/host/identityVerificationScreens/verification_done_page.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({super.key});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [7, 7],
                  color: AppColor.primaryColor,
                  strokeWidth: 1,
                  borderPadding: const EdgeInsets.all(0),
                  child: Expanded(
                    child: Container(
                      color: AppColor.whiteColor,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            commonBorderButton("Retake Photo"),
            const SizedBox(
              height: 20,
            ),
            commonButton("Submit", onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VerificationDonePage()));
            }),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
