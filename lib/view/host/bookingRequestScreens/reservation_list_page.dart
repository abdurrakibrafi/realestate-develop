import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/controller/booking/new_booking_controller.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/view/host/bookingRequestScreens/reservation_details_page.dart';
import 'package:real_estate_management/viewModel/controllers/bookingControllers/my_booking_controller.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  State<ReservationListPage> createState() => _ReservationListStatePage();
}

class _ReservationListStatePage extends State<ReservationListPage>  with SingleTickerProviderStateMixin {
  //MyBookingController controller = Get.put(MyBookingController());
  NewBookingController newBookingController = Get.put(NewBookingController());
  TabController? tabController;
  @override
  void initState() {
    newBookingController.newBookingRequest();
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async {
        await newBookingController.newBookingRequest();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText("New Bookings".tr, size: 15),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
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
          if (newBookingController.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () async{
              await newBookingController.newBookingRequest();
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: TabBarView(
                controller: tabController,
                children: [pendingTab(),onGoingTab() ,onCloseTab()],
              ),
            ),
          );
        }),
      )
      ],
    ),


      ),
    );
  }
  Widget pendingTab() {
    return  (newBookingController.newBookingList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: () async{
            await newBookingController.newBookingRequest();
          },
          child: ListView.builder(
          itemCount: newBookingController.newBookingList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                color: AppColor.whiteColor,
                elevation: 4,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.network(
                        newBookingController.newBookingList[index].residence!.images!
                            .isEmpty
                            ? DummyImage.networkImage
                            : newBookingController.newBookingList[index].residence!
                            .images[0].url!,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(

                                child: commonText(
                                    newBookingController.newBookingList[index]
                                        .residence!.propertyName!,
                                    size: 16,
                                    maxLines: 1,
                                    color: AppColor.blackColor,
                                    isBold: true),
                                width: 300,
                              ),
                              Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage(
                                        "assets/icons/starIcon.png"),
                                    color: AppColor.primaryColor,
                                    size: 22.0,
                                  ),
                                  commonText(
                                      "${newBookingController.newBookingList[index]
                                          .residence?.averageRating}",
                                      size: 14,
                                      color: AppColor.blackColor,
                                      isBold: true),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              const ImageIcon(
                                AssetImage(
                                    "assets/icons/locationIcon2.png"),
                                size: 15.0,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              commonText(
                                  newBookingController.newBookingList[index]
                                      .residence!.address!.area!,
                                  size: 12,
                                  color: AppColor.superDarkGreyColor),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    const ImageIcon(
                                      color: AppColor.primaryColor,
                                      AssetImage(
                                          "assets/icons/calenderIcon.png"),
                                      size: 15.0,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    commonText(
                                        '${DateFormat('d MMM').format(DateTime.parse(newBookingController.newBookingList[index].startDate.toString()))} - ${DateFormat('d MMM').format(DateTime.parse(newBookingController.newBookingList[index].endDate.toString()))}',
                                        size: 14,
                                        color: AppColor.primaryColor),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                      '${newBookingController.newBookingList[index].residence!.rent!.toString()} K.D',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        height: 1.3,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/Month'.tr,
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          commonButton(
                            "Details".tr,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReservationDetailsPage(
                                          booking: newBookingController
                                              .newBookingList[index],
                                        )),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
  }
  Widget onGoingTab() {
    return  (newBookingController.newBookingApprovedList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: ()async {
            await newBookingController.newBookingRequest();
          },
          child: ListView.builder(
          itemCount: newBookingController.newBookingApprovedList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                color: AppColor.whiteColor,
                elevation: 4,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.network(
                        newBookingController.newBookingApprovedList[index].residence!.images!
                            .isEmpty
                            ? DummyImage.networkImage
                            : newBookingController.newBookingApprovedList[index].residence!
                            .images[0].url!,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(

                                child: commonText(
                                    newBookingController.newBookingApprovedList[index]
                                        .residence!.propertyName!,
                                    size: 16,
                                    maxLines: 1,
                                    color: AppColor.blackColor,
                                    isBold: true),
                                width: 300,
                              ),
                              Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage(
                                        "assets/icons/starIcon.png"),
                                    color: AppColor.primaryColor,
                                    size: 22.0,
                                  ),
                                  commonText(
                                      "${newBookingController.newBookingApprovedList[index]
                                          .residence?.averageRating}",
                                      size: 14,
                                      color: AppColor.blackColor,
                                      isBold: true),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              const ImageIcon(
                                AssetImage(
                                    "assets/icons/locationIcon2.png"),
                                size: 15.0,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              commonText(
                                  newBookingController.newBookingApprovedList[index]
                                      .residence!.address!.area!,
                                  size: 12,
                                  color: AppColor.superDarkGreyColor),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    const ImageIcon(
                                      color: AppColor.primaryColor,
                                      AssetImage(
                                          "assets/icons/calenderIcon.png"),
                                      size: 15.0,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    commonText(
                                        '${DateFormat('d MMM').format(DateTime.parse(newBookingController.newBookingApprovedList[index].startDate.toString()))} - ${DateFormat('d MMM').format(DateTime.parse(newBookingController.newBookingApprovedList[index].endDate.toString()))}',
                                        size: 14,
                                        color: AppColor.primaryColor),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                      '${newBookingController.newBookingApprovedList[index].residence!.rent!.toString()} K.D',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        height: 1.3,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/Month'.tr,
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          commonButton(
                            "Details".tr,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReservationDetailsPage(
                                          booking: newBookingController
                                              .newBookingApprovedList[index],
                                        )),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
  }
  Widget onCloseTab() {
    return  (newBookingController.newBookingCancelList.isEmpty)
        ? emptyListView()
        : RefreshIndicator(
          onRefresh: ()async {
            await newBookingController.newBookingRequest();
          },
          child: ListView.builder(
          itemCount: newBookingController.newBookingCancelList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Card(
                color: AppColor.whiteColor,
                elevation: 4,
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12)),
                      child: Image.network(
                        newBookingController.newBookingCancelList[index].residence!.images!
                            .isEmpty
                            ? DummyImage.networkImage
                            : newBookingController.newBookingCancelList[index].residence!
                            .images[0].url!,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(

                                child: commonText(
                                    newBookingController.newBookingCancelList[index]
                                        .residence!.propertyName!,
                                    size: 16,
                                    maxLines: 1,
                                    color: AppColor.blackColor,
                                    isBold: true),
                                width: 300,
                              ),
                              Row(
                                children: [
                                  const ImageIcon(
                                    AssetImage(
                                        "assets/icons/starIcon.png"),
                                    color: AppColor.primaryColor,
                                    size: 22.0,
                                  ),
                                  commonText(
                                      "${newBookingController.newBookingCancelList[index]
                                          .residence?.averageRating}",
                                      size: 14,
                                      color: AppColor.blackColor,
                                      isBold: true),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              const ImageIcon(
                                AssetImage(
                                    "assets/icons/locationIcon2.png"),
                                size: 15.0,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              commonText(
                                  newBookingController.newBookingCancelList[index]
                                      .residence!.address!.area!,
                                  size: 12,
                                  color: AppColor.superDarkGreyColor),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    borderRadius:
                                    BorderRadius.circular(20)),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    const ImageIcon(
                                      color: AppColor.primaryColor,
                                      AssetImage(
                                          "assets/icons/calenderIcon.png"),
                                      size: 15.0,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    commonText(
                                        '${DateFormat('d MMM').format(DateTime.parse(newBookingController.newBookingCancelList[index].startDate.toString()))} - ${DateFormat('d MMM').format(DateTime.parse(newBookingController.newBookingCancelList[index].endDate.toString()))}',
                                        size: 14,
                                        color: AppColor.primaryColor),
                                  ],
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: GoogleFonts.getFont(
                                    'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                      '${newBookingController.newBookingCancelList[index].residence!.rent!.toString()} K.D',
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        height: 1.3,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/Month'.tr,
                                      style: GoogleFonts.getFont(
                                        'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        height: 1.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          commonButton(
                            "Details".tr,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ReservationDetailsPage(
                                          booking: newBookingController
                                              .newBookingCancelList[index],
                                        )),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
  }
}
