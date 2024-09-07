import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/controller/payment/ad_create.dart';
import 'package:real_estate_management/res/components/common_button.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/view/guest/paymentScreens/payment_page.dart';

import '../../common/payment/view/create_boost_view.dart';
import '../../guest/guest_root_screen.dart';

class WantPaymentScreen extends StatefulWidget {
  final String propertyId;
  const WantPaymentScreen({super.key, required this.propertyId});

  @override
  State<WantPaymentScreen> createState() => _WantPaymentScreenState();
}

class _WantPaymentScreenState extends State<WantPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(color: Colors.yellow),
      ]),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Image.asset("assets/images/addListening/boost.png")],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 300,
                child: commonText(
                  'Boost 1 Month for 2 K.D'.tr,
                  size: 20,
                  isBold: true,
                  textAlign: TextAlign.center,
                ),
              ),
              commonText("\nStand out from the crowd with paid advertising!"),
              const SizedBox(height: 30.0),
              commonBorderButton("Skip",
              onTap: () => Get.offAll(() => const GuestRootScreen()),
              ),
              const SizedBox(
                height: 20,
              ),
              commonButton(
                "Continue".tr,
                onTap: () {
                 /* Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PaymentPage(
                        isHost: true,
                        isGust: true,
                      );
                    },
                  ));*/



                  Get.to(() => const CreateBoostView(propertyId: '',));

                },
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
