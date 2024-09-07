import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/view/guest/paymentScreens/review_summary_page.dart';

import '../../../../models/bookingModels/my_booked_model.dart';

class BookingDetailsPage extends StatefulWidget {
  final Booked data;
  const BookingDetailsPage({super.key, required this.data});

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  List<String> houseRules = [
    "All transactions require a signed contract and deposit.",
    "Properties are sold as-is unless otherwise stated.",
    "Viewings are by appointment only.",
    "Tenants must adhere to community guidelines and regulations.",
    "Late payments may incur additional fees.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText(
            "Details".tr,
            size: 16,
            isBold: true,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColor.primaryColor,
                            child: Icon(
                              Icons.date_range_outlined,
                              color: AppColor.whiteColor,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          commonText(
                              "${DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.data.createdAt!.toString()))} - ${DateFormat('dd-MM-yyyy').format(DateTime.parse(widget.data.endDate!.toString()))}",
                              size: 14,
                              isBold: true),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.transparent,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: material.Image.network(
                              DummyImage.networkImage,
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 7, 10.2, 7),
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColorLight,
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      child: commonText('Success'.tr,
                                          size: 12,
                                          color: AppColor.primaryColor),
                                    ),
                                  ],
                                ),
                                // commonText(
                                //   'Booking Number: FGREKLT',
                                //   size: 12,
                                //   isBold: true,
                                // ),
                                commonText(
                                  widget.data.residence!.propertyName!,
                                  size: 16,
                                  isBold: true,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const ImageIcon(
                                      AssetImage(
                                          "assets/icons/locationIcon.png"),
                                      color: AppColor.darkGreyColor,
                                    ),
                                    Expanded(
                                      child: commonText(
                                        widget.data.residence!.address!.area!,
                                        color: AppColor.darkGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    commonText(
                                        widget.data.residence!.rent.toString(),
                                        color: AppColor.primaryColor,
                                        isBold: true,
                                        size: 13),
                                    commonText('Month'.tr,
                                        color: AppColor.primaryColor,
                                        isBold: true,
                                        size: 13),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    leading: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10.1, 0),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: const Color(0xFFD9D9D9),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            DummyImage.networkImage,
                          ),
                        ),
                      ),
                    ),
                    title: commonText(widget.data.author!.name!,
                        size: 16, isBold: true),
                    subtitle: commonText(widget.data.author!.role!,
                        size: 14, color: Colors.grey),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10.1, 0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.shade100),
                          child: material.Image.asset(
                            "assets/icons/chatIcon.png",
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 10.1, 0),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber.shade100),
                          child: const Icon(
                            Icons.call,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  commonText("House Rules".tr, size: 14, isBold: true),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        houseRules.length,
                        (index) => commonText(
                            "${index + 1}. ${houseRules[index]}",
                            size: 11)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      commonText('Get directions'.tr, size: 14, isBold: true),
                      commonText('View on Map'.tr,
                          size: 12, color: AppColor.primaryColor),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ImageIcon(
                        AssetImage('assets/icons/locationIcon.png'),
                      ),
                      commonText('1012 Ocean avanue, New yourk, USA',
                          isBold: true, size: 12, color: AppColor.blackColor),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 201,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              DummyImage.networkImage,
                            ))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: commonBorderButton(
                        "Contract".tr,
                        onTap: () {
                          Get.to(() => ReviewSummaryPage(
                              data: widget.data,
                          )
                          );
                        },
                      )),
                      Expanded(
                          child: commonButton(
                        "Help?".tr,
                        textSize: 12,
                        onTap: () {},
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
