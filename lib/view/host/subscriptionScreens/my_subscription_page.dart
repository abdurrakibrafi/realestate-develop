import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/viewModel/controllers/subscription_controller/my_subscription_controller.dart';

class MySubscriptionsPage extends StatelessWidget {
  const MySubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MySubscriptionController controller =
        Get.put(MySubscriptionController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("My Subscription".tr,
            size: 16, isBold: true, color: AppColor.superDarkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Obx(() {
                  if (controller.isLoading.isTrue) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    padding: const EdgeInsets.all(21),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(width: 1, color: AppColor.primaryColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Image.asset(
                              "assets/icons/medal-star.png",
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                commonText(
                                    controller.mySubscriptionData.value!
                                        .package!.name!.tr,
                                    size: 24.0,
                                    isBold: true),
                                Row(
                                  children: [
                                    commonText(
                                        '${controller.mySubscriptionData.value!.package!.price!} K.D',
                                        size: 16.0,
                                        isBold: true),
                                    commonText('/Month',
                                        size: 14.0, color: Colors.grey),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.mySubscriptionData.value!
                                    .package!.features!.length,
                                itemBuilder: (context, index2) {
                                  return buildFeatureItem(controller
                                      .mySubscriptionData
                                      .value!
                                      .package!
                                      .features![index2]
                                      .tr);
                                }),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: commonBorderButton("Downgrade")),
                            Expanded(child: commonButton("Updrade")),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  );
                }),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: AppColor.blackColor,
            radius: 10,
            child: Icon(
              Icons.done,
              size: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: commonText(feature,
                color: Colors.black, size: 16, isBold: true),
          ),
        ],
      ),
    );
  }
}
