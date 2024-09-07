import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/models/bookingModels/new_booking_model.dart';

import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';
import 'package:real_estate_management/view/host/bookingRequestScreens/booking_sign_view.dart';
import 'package:real_estate_management/viewModel/controllers/bookingControllers/booking_accept_reject_controller.dart';

class ReservationDetailsPage extends StatelessWidget {
  final Datum booking;
  const ReservationDetailsPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    BookingAcceptDeclineController controller =
        Get.put(BookingAcceptDeclineController());
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: material.Image.asset(
          "assets/images/Logo.png", // Replace with your logo path
          height: 50,
        ),
        centerTitle: true,
        actions: [
          commonText("1/2",),
          const SizedBox(width: 10,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


             // const SizedBox(height: 20),

              // Booking Details Header
              Center(
                child: commonText("Booking Details",
                    size: 18, isBold: true, color: Colors.black),
              ),
              const SizedBox(height: 10),

              // Booking Details
              _buildDetailRow(
                  "Booking Date",
                  DateFormat('d MMM yyyy | hh:mm a')
                      .format(DateTime.parse(booking.createdAt.toString()).toLocal()),
                  Colors.orange),
              _buildDetailRow("Check-in",
                  DateFormat('d MMM').format(DateTime.parse(booking.startDate.toString()))),
              _buildDetailRow("Check-out",
                  DateFormat('d MMM').format(DateTime.parse(booking.endDate.toString()))),
              // _buildDetailRow("Duration", data.d),
              _buildDetailRow(
                  "Amount", booking.residence!.rent.toString(), Colors.orange),

              const SizedBox(height: 20),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),

              // Tenant Details Header
              Center(
                child: commonText("Tenant Details",
                    size: 18, isBold: true, color: Colors.black),
              ),
              const SizedBox(height: 10),

              // Tenant Details
              _buildDetailRow("Number of Guests",
                  "${booking.guest?.adult.toString()} Adults • ${booking.guest?.child.toString()} Child"),
              _buildDetailRow("Full Name", "${booking.user?.name}", Colors.orange),
              _buildDetailRow("Gender", "${booking.user?.gender}"),
              _buildDetailRow(
                  "Nationality", "${booking.user?.nationality}", Colors.orange),
              _buildDetailRow("Marital Status", "${booking.user?.maritalStatus}"),
              _buildDetailRow("Date of Birth", "${booking.user?.dateOfBirth}"),
              _buildDetailRow("Job Title", "${booking.user?.status}"),
              _buildDetailRow(
                  "Income", "${booking.user?.monthlyIncome}", Colors.orange),

              const SizedBox(
                height: 30,
              ),
              booking.status == "pending"?   Obx(() {
                return Row(
                  children: [
                    Expanded(
                        child: commonBorderButton("Cancel",
                            isLoading: controller.loadingc.value, onTap: () {
                      controller.updateProfileApi(booking.id!, false,booking.id!);
                    })),
                    Expanded(
                        child: commonButton("Accept",
                            isLoading: controller.loadinga.value, onTap: () {
                            //  Get.to(() => BookingSignView(bookingId: booking.id!,));
                      controller.updateProfileApi(booking.id!, true,booking.id!);
                    })),
                  ],
                );
              }) : SizedBox(),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, [Color? valueColor]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          commonText(label, size: 14, isBold: true, color: Colors.black),
          commonText(value,
              size: 14, isBold: true, color: valueColor ?? Colors.black),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      commonText('Do you want to decline?'.tr,
                          size: 20.0, isBold: true),
                      commonText("Sure want to decline this offer", size: 14)
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColor.whiteColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle No action
                            Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: commonText('Cancle'.tr,
                                isBold: true,
                                color: AppColor.blackColor,
                                size: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: () {
                            // Handle Yes action
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: commonText(
                              'Yes, Decline'.tr,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
