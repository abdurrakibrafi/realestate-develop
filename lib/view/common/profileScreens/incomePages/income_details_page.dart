import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';

class IncomeDetailsPage extends StatefulWidget {
  const IncomeDetailsPage({super.key});

  @override
  State<IncomeDetailsPage> createState() => _IncomeDetailsPageState();
}

class _IncomeDetailsPageState extends State<IncomeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("Income Details".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://s3-alpha-sig.figma.com/img/b988/32d8/09b854f807afd5d39bee262977ae092a?Expires=1718582400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=lTmiC6Upy0ptW5Ly9tsNJtqjSBzPK7d~VS8UFhko2ueDwK-tKFc8Qe~jjucSY6txbqSF077vYmiOYDKmud4YccG4Os1WLlsWGyMeM3r4chrE40iE7g9~nrUkQ6KXo53vp1dlPUM3M55wQxiBP9B9ZhIyXSyM8mLF0tMi2hbjlLxbezKjn8q9gdm484b5KWIpqQ8yOdLDtJPnox0YWx2FzuH2T8Ix2VI80oOr7-o0RJJ9E~-l1RotFT9CGRERl79MNK5WqI-AW4mwD5mWqdw1Q~Hj3ZbbT6udTG4btlQp0osjCpiwzglaLo04Q~Cos9I13vG~beFP2R4fBAtsLFGXBQ__"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child:
                        commonText("Brooklyn Simmons", size: 16, isBold: true),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: commonText("Information".tr,
                        isBold: true, size: 20, color: AppColor.primaryColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  commonTextRow("Customer ID:".tr, "#1234"),
                  commonTextRow("Email".tr, "Brookl@gmail.com"),
                  commonTextRow("Trx ID:".tr, "#123456789"),
                  commonTextRow("Time & Date:".tr, "4:15 PM, 13/02/24"),
                  commonTextRow("Amount:".tr, "\$25.02"),
                  commonTextRow("Payment Method:".tr, "Debit Card"),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget commonTextRow(String startText, String endText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: commonText(startText,
                size: 15, color: AppColor.superDarkGreyColor),
          ),
          Expanded(
            child: commonText(endText,
                size: 15, color: AppColor.superDarkGreyColor),
          ),
        ],
      ),
    );
  }
}
