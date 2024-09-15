import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/guest/paymentScreens/review_summary_page.dart';
import 'package:real_estate_management/viewModel/controllers/bookingControllers/booking_request_controller.dart';

class SchedulingPage extends StatefulWidget {
  final String residence;
  final String propertyName;
  final String image;
  final String address;
  final String rating;
  final String price;
  final String discount;
  final String discountCode;
  const SchedulingPage(
      {super.key,
      required this.propertyName,
      required this.address,
      required this.image,
      required this.rating,
      required this.price,
      required this.discount,
      required this.discountCode,
      required this.residence});

  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  SchedulingController controller = Get.put(SchedulingController());

  @override
  Widget build(BuildContext context) {
    log(widget.discountCode);

    double totalAmount() {
      return (int.parse(widget.price) + 10) - controller.discountValue.value;
    }

    return Scaffold(
      appBar: AppBar(
        title: commonText("Booking".tr, isBold: true, size: 20),
        backgroundColor: AppColor.whiteColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPropertyInfo(),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            _buildDateSelection(),
            const SizedBox(height: 20),
            const Divider(),
         //   const SizedBox(height: 10),
            _buildGuestSelection(),
            const SizedBox(height: 20),
            const Divider(),
           // const SizedBox(height: 20),
            //_buildBookingSummary(totalAmount()),
            Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: controller.isChecked.value,
                    onChanged: (bool? value) {
                      controller.toggleCheckbox();
                    },
                  ),
                ),
                 Text('I agree to share my personal information with this landlord'.tr,style: TextStyle(fontSize: 11),),
              ],
            ),
            const SizedBox(height: 20),
            Obx(() => commonButton("Send Request".tr,isLoading: controller.loading.value,
              onTap: () {
                controller.api(
                    widget.residence,
                    widget.propertyName,
                    widget.rating,
                    widget.address,
                    widget.price,
                    DateFormat('yyyy-MM-dd')
                        .format(controller.selectedValue.value),
                    DateFormat('yyyy-MM-dd').format(
                        controller.selectedValue.value.add(Duration(
                            days: controller.totalDuration.value))),
                    controller.totalDuration.value.toString(),
                    controller.adultCount.value.toString(),
                    controller.childCount.value.toString(),
                    widget.discount,
                    controller.discountValue.value.toString(),
                    totalAmount().toString()
                );
              },
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyInfo() {
    return Card(
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
              child: Image.network(
                widget.image,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(

                        child: commonText(
                          widget.propertyName,
                          size: 14,
                          maxLines: 1,
                          isBold: true,
                        ),
                        width: 170,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: AppColor.primaryColor, size: 20),
                          commonText(widget.rating),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImageIcon(
                        AssetImage("assets/icons/locationIcon.png"),
                        color: AppColor.darkGreyColor,
                      ),
                      Expanded(
                        child: commonText(
                          widget.address,
                          color: AppColor.darkGreyColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      commonText(widget.price,
                          color: AppColor.primaryColor, isBold: true, size: 13),
                      commonText(' K.D/Month'.tr,
                          color: AppColor.blackColor, size: 13),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    List<String> durations = ["1 Week", "1 Month", "3 Months", "1 Year"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonText("Select Check-in Date".tr, isBold: true, size: 16),

          ],
        ),
        const SizedBox(height: 10),
        DatePicker(
          height: 100,
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColor.primaryColor,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            controller.selectedValue.value = date;
          },
        ),
        const SizedBox(height: 10),
        commonText("Select Duration of Contract".tr, isBold: true, size: 16),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(durations.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.selectedDurationIndex.value = index;
                switch (index) {
                  case 0:
                    controller.totalDuration.value = 7;
                    break;

                  case 1:
                    controller.totalDuration.value = 30;
                    break;

                  case 2:
                    controller.totalDuration.value = 90;
                    break;

                  case 3:
                    controller.totalDuration.value = 365;
                    break;

                  default:
                }
              },
              child: Obx(() {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: controller.selectedDurationIndex.value == index
                        ? AppColor.primaryColor
                        : Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: commonText(durations[index],
                      color: controller.selectedDurationIndex.value == index
                          ? AppColor.whiteColor
                          : Colors.black),
                );
              }),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildGuestSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText("Number of Guests", isBold: true, size: 16),
        const SizedBox(height: 10),
        Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _buildGuestCounter("Adult".tr, controller.adultCount.value,
                    (value) {
                  controller.adultCount.value = value;
                }),
              ),
              Expanded(
                child: _buildGuestCounter("Child".tr, controller.childCount.value,
                    (value) {
                  controller.childCount.value = value;
                }),
              ),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildGuestCounter(String label, int count, Function(int) onChanged) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.amber.shade50),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          children: [
            commonText(label, size: 14, isBold: true),
            const SizedBox(width: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    if (count > 0) onChanged(count - 1);
                  },
                  icon: const CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    radius: 10,
                    child: FittedBox(
                        child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.remove, color: AppColor.blackColor),
                    )),
                  ),
                ),
                commonText("$count", isBold: true, size: 16),
                IconButton(
                  onPressed: () {
                    onChanged(count + 1);
                  },
                  icon: const CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    radius: 10,
                    child: FittedBox(
                        child: Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(Icons.add, color: AppColor.blackColor),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookingSummary(double price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            commonText("Booking Summary", isBold: true, size: 16),
            const SizedBox(
              height: 10,
            ),
         /*   Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: commonTextfield(controller.discountController.value,
                        hintText: "Discount Code",
                        borderColor: AppColor.primaryColor),
                  ),
                ),
                Expanded(
                    child: commonButton("Check", onTap: () {
                  if (controller.discountController.value.text ==
                      widget.discountCode) {
                    controller.discountValue.value =
                        (int.parse(widget.discount) / 100) *
                            int.parse(widget.price);
                    controller.hasDiscount.value = true;
                    setState(() {});
                  } else {
                    Utils.snackBar("Not Found", "No discount found");
                  }
                }))
              ],
            ),*/
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        commonTextRow("Rent".tr, "${widget.price} K.D"),
        Obx(() {
          return Visibility(
            visible: controller.hasDiscount.value,
            child: commonTextRow("Discount -${widget.discount}%".tr,
                "${controller.discountValue.value} K.D",
                color: Colors.red),
          );
        }),
        commonTextRow("Service Fee ".tr, "10 K.D."),
       /* const SizedBox(
          height: 30,
        ),
        Container(
          color: Colors.amber.shade50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText("Amount Payable".tr,
                    size: 14, color: AppColor.blackColor, isBold: true),
                commonText("$price K.D.",
                    size: 14, color: AppColor.primaryColor, isBold: true),
              ],
            ),
          ),
        ),*/
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget commonTextRow(String startText, String endText,
      {Color color = AppColor.blackColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(startText, color: color, isBold: true, size: 14),
          commonText(endText, color: color, isBold: true, size: 14),
        ],
      ),
    );
  }
}
