import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/models/notificationModels/mark_as_read_notification.dart';
import 'package:real_estate_management/repository/notificationRepository/notification_repository.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/want_payment.dart';
import 'package:real_estate_management/viewModel/controllers/notificationControllers/notification_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller =
        Get.put(NotificationController(), permanent: false);
    final _api = NotificationRepository();
    return WillPopScope(
      onWillPop: () async {
        Get.delete<NotificationController>();
        return true; // return true to allow the pop
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText("Notifications".tr,
              size: 16, isBold: true, color: AppColor.blackColor),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () async {
                MarkAsReadNotification notificationModel =
                    await _api.markAsReadNotificationApi();
                if (notificationModel.data != null &&
                    notificationModel.success == true) {
                  controller.fetchData();
                } else {
                  Utils.snackBar("Error", notificationModel.message.toString());
                }

              },
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(
                  Icons.done_all,
                  color: AppColor.primaryColor,
                ),
              ),
            ),

          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }else if(controller.adsDataList.isEmpty){
            return emptyListView();
          }


          return ListView.builder(
              itemCount: controller.adsDataList.length,
              itemBuilder: (context, index) {
                final notification = controller.adsDataList[index];
                return InkWell(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: ListTile(
                    tileColor: notification.read == true
                        ? Colors.white
                        : AppColor.superLightGreyColor,
                    leading: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: AppColor.superLightGreyColor,
                        shape: BoxShape.circle,
                      ),
                      child: const ImageIcon(
                        color: Color.fromRGBO(146, 88, 0, 1),
                        AssetImage("assets/icons/calenderIcon.png"),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: commonText(notification.message!,
                              size: 14, isBold: true),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.circle,
                              size: 10,
                              color: AppColor.primaryColor,
                            ),
                            commonText(
                                DateFormat('h.mm a').format(
                                    DateTime.parse(notification.createdAt!)
                                        .toLocal()),
                                color: AppColor.darkGreyColor),
                          ],
                        )
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExpandableText(
                          notification.description!,
                          expandText: 'Read more',
                          collapseText: 'show less',
                          maxLines: 3,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          linkColor: AppColor.primaryColor,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.done_all),
                title: commonText("Mark as Read", size: 16, isBold: true),
                subtitle: commonText("Mark notification as read"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.mic),
                title: commonText("Turn off", size: 16, isBold: true),
                subtitle: commonText("Stop receiving notifications for 1 hour"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: commonText("Delete", size: 16, isBold: true),
                subtitle: commonText("Delete this notification"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        );
      },
    );
  }
}
