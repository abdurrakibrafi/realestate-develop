import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:lottie/lottie.dart';

import '../../../../res/components/common_button.dart';
import '../../../guest/guest_root_screen.dart';


class PaymentFailed extends StatelessWidget {
  const PaymentFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/failed.json'),
          Text("Payment faild"),
          commonButton("Back to Dashboard",onTap: ()=> Get.offAll(() => GuestRootScreen(indexValue: 0,)))
        ],
      ),
    );
  }
}
