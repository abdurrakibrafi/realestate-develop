import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:real_estate_management/res/colors/colors.dart';

import '../../../../controller/payment/ad_create.dart';
import '../../../../controller/payment/payment_controller.dart';
import '../../../../res/components/common_button.dart';

class CreateBoostView extends StatefulWidget {
  final String propertyId;
  const CreateBoostView({Key? key, required this.propertyId}) : super(key: key);

  @override
  _CreateBoostViewState createState() => _CreateBoostViewState();
}

class _CreateBoostViewState extends State<CreateBoostView> {
  final AdController adController = Get.put(AdController());
  int selectedMonths = 2; // Default selected months
  final double pricePerMonth = 2.0;
  File? _selectedImage;
  String? imageData;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
        imageData = image.path;
      });
    }
  }

  void onMonthSelected(int months) {
    setState(() {
      selectedMonths = months;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Boost'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: _selectedImage != null
                    ? Image.file(
                  _selectedImage!,
                  fit: BoxFit.cover,
                )
                    : const Center(child: Text('Tap to select image')),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedMonths == 1 ? AppColor.primaryColor : Colors.white,
                  ),
                  onPressed: () => onMonthSelected(1),
                  child:  Text('1 Months',style: TextStyle(color: selectedMonths == 1? Colors.white : Colors.black),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedMonths == 2 ? AppColor.primaryColor : Colors.white,
                  ),
                  onPressed: () => onMonthSelected(2),
                  child:  Text('2 Months',style: TextStyle(color: selectedMonths == 2? Colors.white : Colors.black),),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    selectedMonths == 3 ? AppColor.primaryColor : Colors.white,
                  ),
                  onPressed: () => onMonthSelected(3),
                  child:  Text('3 Months',style: TextStyle(color: selectedMonths == 3? Colors.white : Colors.black),),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Boost 1 Month for $pricePerMonth K.D',
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              'Boost Total: ${selectedMonths * pricePerMonth} K.D',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Obx(() => ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primaryColor,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32, vertical: 16),
              ),
              onPressed: () {
                if(imageData == null){
                  Get.snackbar("Error", "Please add banner");
                }else{
                  adController.createAd(month: selectedMonths, propertyId: '66b49d136e97ef48d41c5670',image: imageData.toString());
                }

              },
              child: adController.isLoading.value == true? Center(child: CircularProgressIndicator(color: Colors.white,),)  :  const Text('Submit and Payment',style: TextStyle(color: Colors.white),),
            ),)
          ],
        ),
      ),
    );
  }
}