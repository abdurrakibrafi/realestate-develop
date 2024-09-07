import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/viewModel/controllers/paymentsControllers/payments_controller.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  PaymentsController controller = Get.put(PaymentsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Payment History".tr,
            size: 16, isBold: true, color: AppColor.darkGreyColor),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange, borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Center(
                    child: commonText('Tax Number'.tr,
                        color: Colors.white, size: 11),
                  )),
                  Expanded(
                      flex: 2,
                      child: Center(
                        child: commonText('Payment Type'.tr,
                            color: Colors.white, size: 11),
                      )),
                  Expanded(
                      child: Center(
                          child: commonText('Date'.tr,
                              color: Colors.white, size: 11))),
                  Expanded(
                      child: Center(
                    child:
                        commonText('Amount'.tr, color: Colors.white, size: 11),
                  )),
                  Expanded(
                      child: Center(
                    child:
                        commonText('Status'.tr, color: Colors.white, size: 11),
                  )),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return const Center(child: CircularProgressIndicator());
                }
                return (controller.paymentDataList.isEmpty)
                    ? emptyListView()
                    : ListView.separated(
                        itemCount: controller.paymentDataList.length,
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.black45,
                          height: 0.1,
                        ),
                        itemBuilder: (context, index) {
                          final record = controller.paymentDataList[index];
                          return Container(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Center(
                                  child: commonText(record.transitionId!,
                                      size: 10),
                                )),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                      child: commonText(record.type!, size: 10),
                                    )),
                                Expanded(
                                    child: Center(
                                        child: commonText(
                                            DateFormat('dd-MM-yyyy')
                                                .format(DateTime.parse(
                                              record.createdAt!,
                                            )),
                                            size: 10))),
                                Expanded(
                                    child: Center(
                                  child: commonText(record.amount!.toString(),
                                      size: 10),
                                )),
                                Expanded(
                                    child: Center(
                                  child: commonText(record.status!, size: 10),
                                )),
                              ],
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
