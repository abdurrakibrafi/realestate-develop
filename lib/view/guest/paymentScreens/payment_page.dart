// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:real_estate_management/res/components/common_button.dart';

import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/components/common_textfield.dart';
import 'package:real_estate_management/view/guest/paymentScreens/booking_successfull_page.dart';
import 'package:real_estate_management/view/host/addResidenceScreens/ads_sucessfull.dart';

class PaymentPage extends StatefulWidget {
  bool isHost;
  bool isGust;
  PaymentPage({super.key, required this.isHost, required this.isGust});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  int _selectedPaymentMethod = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.amber,
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonText("Payment", size: 24, isBold: true),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonText(
                    "Add Payment Method",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPaymentOption(0, "assets/images/payment/visa.png", ""),
                  _buildPaymentOption(
                      1, "assets/images/payment/master.png", ""),
                  _buildPaymentOption(
                      2, "assets/images/payment/paypal.png", ""),
                  _buildPaymentOption(3, "", "Other"),
                ],
              ),
              SizedBox(height: 30),
              commonTextfieldWithTitle(
                "Card Holder",
                cardHolderNameController,
                borderradious: 5,
                hintText: "Card holder",
              ),
              SizedBox(height: 20),
              commonTextfieldWithTitle(
                "Card Number",
                cardNumberController,
                hintText: "Card number",
                keyboardType: TextInputType.number,
                borderradious: 5,
              ),
              SizedBox(height: 20),
              commonTextfieldWithTitle(
                "CVV/CVC",
                cvvController,
                hintText: "Security code",
                borderradious: 5,
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
              SizedBox(height: 20),
              commonTextfieldWithTitle(
                "MM/YY",
                expiryController,
                hintText: "Month/Year",
                borderradious: 5,
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 30),
              commonButton("Pay",
                  onTap: () => Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          if (widget.isHost) {
                            return AdsSuccessfull();
                          } else {
                            return BookingSuccessfull();
                          }
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(int value, String assetPath, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = value;
        });
      },
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: _selectedPaymentMethod,
            onChanged: (int? newValue) {
              setState(() {
                _selectedPaymentMethod = newValue!;
              });
            },
          ),
          if (assetPath.isNotEmpty)
            Image.asset(
              assetPath,
              width: 40, // Adjust the width to match the design
              height: 40, // Adjust the height to match the design
            ),
          if (label.isNotEmpty)
            commonText(
              label,
              color:
                  value == _selectedPaymentMethod ? Colors.black : Colors.grey,
            ),
        ],
      ),
    );
  }
}
