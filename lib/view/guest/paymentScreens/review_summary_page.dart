import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/controller/booking/my_booked_controller.dart';
import 'package:real_estate_management/models/bookingModels/my_booked_model.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';
import 'package:real_estate_management/controller/payment/payment_controller.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/viewModel/controllers/bookingControllers/booking_request_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/components/common_button.dart';

class ReviewSummaryPage extends StatefulWidget {
  final Booked data;
  const ReviewSummaryPage(
      {super.key,
      required this.data,
    });

  @override
  State<ReviewSummaryPage> createState() => _ReviewSummaryPageState();
}

class _ReviewSummaryPageState extends State<ReviewSummaryPage> {

  var controller = Get.put(SchedulingController());


  final PaymentRequestController paymentRequestController = Get.put(PaymentRequestController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,

      body: SizedBox(
        width: double.infinity,
        height: 530,
        child: ColorFiltered(
          colorFilter:
              const ColorFilter.mode(Colors.black45, BlendMode.multiply),
          child: Stack(
            children: [
              material.Image.asset(
                "assets/images/house.png",
                fit: BoxFit.fill,
                width: Get.width,
              ),
              Positioned(
                top: 30,
                left: 27,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CircleAvatar(
                    backgroundColor: AppColor.whiteColor,
                    child: Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                commonText("Booking Summary".tr,
                    size: 16, isBold: true, color: AppColor.blackColor),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: widget.data.residence!.images.isNotEmpty ? material.Image.network(
                          widget.data.residence!.images[0].url.toString(),
                          height: 80, // Adjust as needed
                          width: 90, // Adjust as needed
                          fit: BoxFit.cover,
                        ): material.Image.network(
                          DummyImage.networkImage,
                          height: 80, // Adjust as needed
                          width: 90, // Adjust as needed
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: commonText(
                                    widget.data.residence?.propertyName ?? "",
                                    size: 16,
                                    isBold: true,
                                  ),
                                  width: 200,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: AppColor.primaryColor,
                                        size: 20),
                                    commonText('${widget.data.averageRating}'),
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
                                    widget.data.residence?.address?.governorate ?? "",
                                    color: AppColor.darkGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                commonText(widget.data.totalPrice.toString() ?? "",
                                    color: AppColor.primaryColor,
                                    isBold: true,
                                    size: 13),
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
                const SizedBox(
                  height: 20,
                ),
                commonTextRow("Request Date".tr, DateFormat('dd MMM, yyyy | hh:mm a').format(DateTime.parse(widget.data.createdAt.toString()))),
                commonTextRow("Check-in".tr,
                    DateFormat('dd MMM, yyyy').format(DateTime.parse(widget.data.startDate.toString()))),
                commonTextRow("Check-Out".tr, DateFormat('dd MMM, yyyy').format(DateTime.parse(widget.data.endDate.toString()))),
              //  commonTextRow("Duration".tr, "${widget.duration} days"),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                commonTextRow("Number of Guests".tr,
                    "${widget.data.guest?.adult} Adults • ${widget.data.guest?.child} Child"),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                commonTextRow("Rent".tr, "${widget.data.totalPrice.toString()} K.D"),
               /* Visibility(
                  visible: widget.discountAmount != "0.0",
                  child: commonTextRow(
                      "Discount -${widget.discount}%".tr, widget.discountAmount,
                      color: Colors.red),
                ),*/
                commonTextRow("Service Fee".tr, "10 K.D"),
                const SizedBox(
                  height: 20,
                ),
                commonText("A contract fee is required to confirm your booking. All other payments must be made directly to the landlord. We do not handle rent collection.",textAlign: TextAlign.center,color: Color(0xff757575)),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.amber.shade50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonText("Amount Payable".tr,
                            color: AppColor.blackColor, isBold: true),
                        commonText("10.000 K.D",
                            color: AppColor.primaryColor, isBold: true),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                widget.data.status.toString() == "pending"?  commonBorderButton(
                  "Waiting for landlord approve",
                  onTap: () {
                    paymentRequestController.paymentRequest(
                        bookingId: widget.data.id,
                        BookingResidence: "BookingResidence"
                    );
                  },
                ): SizedBox(),

                widget.data.status.toString() == "approved" && widget.data.isPaid == false?  commonButton(
                  "Pay Now",
                  onTap: () {
                    paymentRequestController.paymentRequest(
                        bookingId: widget.data.id,
                        BookingResidence: "BookingResidence"
                    );
                  },
                ): SizedBox(),

                widget.data.status.toString() == "approved" && widget.data.isPaid == true?  commonButton(
                  "View Contract",
                  onTap: () {
                    _launchUrl(Uri.parse("https://real-state-admin.s3.eu-north-1.amazonaws.com/images/messages/5551981727006947061"));
                  },
                ): SizedBox(),
                const SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(_url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    }

  Widget commonTextRow(String startText, String endText,
      {Color color = AppColor.blackColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(startText, color: color, isBold: true),
          commonText(endText, color: color, isBold: true),
        ],
      ),
    );
  }
/*  void _launchURL(url) async {
 //   final url = 'https://real-state-admin.s3.eu-north-1.amazonaws.com/images/messages/5551981727006947061';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }*/
}
