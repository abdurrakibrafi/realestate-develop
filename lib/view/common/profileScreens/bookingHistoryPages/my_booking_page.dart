import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/models/bookingModels/my_booking_model.dart';

import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/booking_details_page.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/maintenance_request_page.dart';
import 'package:real_estate_management/view/common/profileScreens/bookingHistoryPages/review_page.dart';
import 'package:real_estate_management/view/guest/schedulingScreens/scheduling_page.dart';
import 'package:real_estate_management/viewModel/controllers/bookingControllers/my_booking_controller.dart';

import '../../../../controller/booking/my_booked_controller.dart';
import '../../../guest/paymentScreens/review_summary_page.dart';

class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  final MyBookedController bookedController = Get.put(MyBookedController());
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    bookedController.getBookingRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        title: commonText("My Bookings".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: AppColor.primaryColor,
            indicatorColor: AppColor.primaryColor,
            tabs: [
              Tab(
                child: Text(
                  'Pending'.tr,
                ),
              ),
              Tab(
                child: Text(
                  'Ongoing'.tr,
                ),
              ),
              Tab(
                child: Text(
                  'Closed'.tr,
                ),
              ),
            ],
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: Obx(() {
              if (bookedController.isLoading.value == true) {
                return const Center(child: CircularProgressIndicator());
              }
              return RefreshIndicator(
                onRefresh: () async{
                  await bookedController.getBookingRequest();
                },
                child: TabBarView(
                  controller: tabController,
                  children: [pendingTab(), onGoingTab(), clodedTab()],
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget pendingTab() {
    return (bookedController.myBookingPendingList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: () async{
            await bookedController.getBookingRequest();
          },
          child: ListView.builder(
          itemCount: bookedController.myBookingPendingList.length,
          itemBuilder: (context, index) {
            var data = bookedController.myBookingPendingList[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: data.residence!.images.isNotEmpty ? Image.network(
                                  data.residence!.images[0].url.toString(),
                                  height: 80, // Adjust as needed
                                  width: 90, // Adjust as needed
                                  fit: BoxFit.cover,
                                ): Image.network(
                                  DummyImage.networkImage,
                                  height: 80, // Adjust as needed
                                  width: 90, // Adjust as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: commonText(
                                            data.residence!.propertyName
                                                .toString(),
                                            size: 14,
                                            isBold: true,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: AppColor.primaryColor,
                                              size: 16,
                                            ),
                                            commonText(data.averageRating
                                                .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/icons/locationIcon.png"),
                                          color: AppColor.darkGreyColor,
                                        ),
                                        Expanded(
                                          child: commonText(
                                            data.residence!.address!.area!,
                                            color: AppColor.darkGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            commonText(
                                              data.residence!.rent.toString(),
                                              color: AppColor.primaryColor,
                                              isBold: true,
                                              size: 13,
                                            ),
                                            commonText(
                                              ' K.D /Month'.tr,
                                              color: AppColor.blackColor,
                                              isBold: true,
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                            /*  Expanded(
                                  child: commonBorderButton(
                                    "Send Request".tr,
                                    fontSize: 12,
                                    height: 35,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MaintenanceRequestGuestPage(
                                                  id: data.residence!.id!,
                                                )),
                                      );
                                    },
                                  )),*/
                              Expanded(
                                  child: commonButton(
                                    "View Details".tr,
                                    textSize: 12,
                                    height: 35,
                                    onTap: () {
                                      /*  Get.to(() => ReviewSummaryPage(
                                        data: widget.data,
                                      )*/
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReviewSummaryPage(
                                                  data: data,
                                                )),
                                      );
                                    },
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
  }
  Widget onGoingTab() {
    return (bookedController.myBookingApprovedList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
      onRefresh: () async{
        await bookedController.getBookingRequest();
      },
          child: ListView.builder(
          itemCount: bookedController.myBookingApprovedList.length,
          itemBuilder: (context, index) {
            var data = bookedController.myBookingApprovedList[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: data.residence!.images.isNotEmpty ? Image.network(
                                  data.residence!.images[0].url.toString(),
                                  height: 80, // Adjust as needed
                                  width: 90, // Adjust as needed
                                  fit: BoxFit.cover,
                                ): Image.network(
                                  DummyImage.networkImage,
                                  height: 80, // Adjust as needed
                                  width: 90, // Adjust as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: commonText(
                                            data.residence!.propertyName
                                                .toString(),
                                            size: 14,
                                            isBold: true,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: AppColor.primaryColor,
                                              size: 16,
                                            ),
                                            commonText(data.averageRating
                                                .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/icons/locationIcon.png"),
                                          color: AppColor.darkGreyColor,
                                        ),
                                        Expanded(
                                          child: commonText(
                                            data.residence!.address!.area!,
                                            color: AppColor.darkGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            commonText(
                                              data.residence!.rent.toString(),
                                              color: AppColor.primaryColor,
                                              isBold: true,
                                              size: 13,
                                            ),
                                            commonText(
                                              ' K.D /Month'.tr,
                                              color: AppColor.blackColor,
                                              isBold: true,
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                             /* Expanded(
                                  child: commonBorderButton(
                                    "Send Request".tr,
                                    fontSize: 12,
                                    height: 35,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MaintenanceRequestGuestPage(
                                                  id: data.residence!.id.toString(),
                                                )),
                                      );
                                    },
                                  )),*/
                              Expanded(
                                  child: commonButton(
                                    "View Details".tr,
                                    textSize: 12,
                                    height: 35,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReviewSummaryPage(
                                                  data: data,
                                                )),
                                      );
                                    },
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
  }

  Widget clodedTab() {
    return (bookedController.myBookingCanceledList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
      onRefresh: () async{
        await bookedController.getBookingRequest();
      },
          child: ListView.builder(
          itemCount: bookedController.myBookingCanceledList.length,
          itemBuilder: (context, index) {
            var data = bookedController.myBookingCanceledList[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: data.residence!.images.isNotEmpty ? Image.network(
                                  data.residence!.images[0].url.toString(),
                                  height: 80, // Adjust as needed
                                  width: 90, // Adjust as needed
                                  fit: BoxFit.cover,
                                ): Image.network(
                                  DummyImage.networkImage,
                                  height: 80, // Adjust as needed
                                  width: 90, // Adjust as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: commonText(
                                            data.residence!.propertyName!,
                                            size: 14,
                                            isBold: true,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: AppColor.primaryColor,
                                              size: 16,
                                            ),
                                            commonText(data.averageRating
                                                .toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const ImageIcon(
                                          AssetImage(
                                              "assets/icons/locationIcon.png"),
                                          color: AppColor.darkGreyColor,
                                        ),
                                        Expanded(
                                          child: commonText(
                                            data.residence!.address!.area!,
                                            color: AppColor.darkGreyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            commonText(
                                              data.residence!.rent!
                                                  .toString(),
                                              color: AppColor.primaryColor,
                                              isBold: true,
                                              size: 13,
                                            ),
                                            commonText(
                                              ' K.D /Month'.tr,
                                              color: AppColor.blackColor,
                                              isBold: true,
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: commonBorderButton(
                                    "Re-book".tr,
                                    height: 35,
                                    fontSize: 12,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SchedulingPage(
                                              residence: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .id!,
                                              propertyName: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .propertyName!,
                                              address: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .address!
                                                  .area!,
                                              rating: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .bathrooms!,
                                              price: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .rent!
                                                  .toString(),
                                              discount: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .discount!
                                                  .toString(),
                                              discountCode: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .discountCode!,
                                              image: bookedController.myBookingCanceledList[index]
                                                  .residence!
                                                  .images[0].url.toString(),
                                            )),
                                      );
                                    },
                                  )),
                              Expanded(
                                  child: commonButton(
                                    "Review".tr,
                                    textSize: 12,
                                    height: 35,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ReviewPage(data: data)),
                                      );
                                    },
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
  }
}
