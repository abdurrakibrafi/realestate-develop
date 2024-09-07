import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../../controller/chat/message_send_controller.dart';
import '../../../controller/chat/payment_submit_controller.dart';

class UploadReceiptDialog extends StatelessWidget {
  final String receiverId;

  UploadReceiptDialog({super.key, required this.receiverId});

  final MessageSendController messageSendController = Get.put(MessageSendController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadReceiptController());

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Upload Payment Receipt',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Ensure your payment receipt is clear and includes all necessary details.\n'
                  '• Accepted formats: JPEG, PNG, or PDF.\n'
                  '• Maximum file size: 5MB.\n'
                  '• Once uploaded, click \'Submit\' to complete the process.',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                controller.pickImage();
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Obx(() {
                    if (controller.selectedImage.value != null) {
                      return Image.file(
                        controller.selectedImage.value!,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.orange,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Upload Payment Receipt',
                            style: TextStyle(fontSize: 16, color: Colors.orange),
                          ),
                        ],
                      );
                    }
                  }),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Obx(() {
                  return Checkbox(
                    value: controller.isConfirmed.value,
                    onChanged: (value) {
                      controller.isConfirmed.value = value ?? false;
                    },
                  );
                }),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'I confirm that the information provided is accurate.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                messageSendController.sendMessage(
                    receiverId,
                    "******************",
                    controller.selectedImagePath.value
                ).then((value) {
                  Get.back();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


