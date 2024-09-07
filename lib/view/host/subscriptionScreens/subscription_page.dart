import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/viewModel/controllers/subscription_controller/subscription_controller.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SubscriptionController controller = Get.put(SubscriptionController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText(
          "Subscription".tr,
          size: 20,
          isBold: true,
        ),
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
                Container(
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
                              commonText('Silver Plan'.tr,
                                  size: 24.0, isBold: true),
                              Row(
                                children: [
                                  commonText('5 K.D', size: 16.0, isBold: true),
                                  commonText('/Month',
                                      size: 14.0, color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          buildFeatureItem('Up to 3 Listings'.tr),
                          buildFeatureItem('Smart Management Tools'),
                          buildFeatureItem('Digitized Rental Agreements'),
                          buildFeatureItem('Automated Rent Collection'),
                          buildFeatureItem(
                              'Maintenance & Permissions Tracking'),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      commonButton("Subscribe Now"),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
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
                            "assets/icons/crown.png",
                            width: 50,
                            height: 50,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonText('Gold Plan', size: 24.0, isBold: true),
                              Row(
                                children: [
                                  commonText('30 K.D',
                                      size: 16.0, isBold: true),
                                  commonText('/Month',
                                      size: 14.0, color: Colors.grey),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          buildFeatureItem('Smart Management Tools'),
                          buildFeatureItem('Digitized Rental Agreements'),
                          buildFeatureItem('Automated Rent Collection'),
                          buildFeatureItem(
                              'Maintenance & Permissions Tracking'),
                          buildFeatureItem('Unlimited Free Listings',
                              color: AppColor.primaryColor),
                          buildFeatureItem('Access to Insights',
                              color: AppColor.primaryColor),
                          buildFeatureItem('Free Optimized Listings',
                              color: AppColor.primaryColor),
                          buildFeatureItem('Dedicated Account Manager',
                              color: AppColor.primaryColor),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      commonButton("Subscribe Now"),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFeatureItem(String feature, {Color color = AppColor.blackColor}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 10,
            child: const Icon(
              Icons.done,
              size: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: commonText(feature,
                color: Colors.black, size: 14, isBold: true),
          ),
        ],
      ),
    );
  }
}
