import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/controller/terms_conditions_controller.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/service/html_view.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class TermsConditionsView extends StatelessWidget {
   TermsConditionsView({super.key});

  final ContentsController contentsController = Get.put(ContentsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Terms and Condition".tr,),),

     /* body: Obx(() => contentsController.isLoading.value == true? Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),) : Padding(
        padding: const EdgeInsets.all(12.0),
       // child: HTMLView(htmlData: contentsController.termsConditionList[0].termsAndConditions.toString()),
        child: Html(
          data: contentsController.termsConditionList[0].termsAndConditions.toString(),
        ),
      )),*/
      body: Obx(() => contentsController.isLoading.value == true? Center(child: CircularProgressIndicator(color: AppColor.primaryColor,),) :  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: HtmlWidget(
            contentsController.termsConditionList[0].termsAndConditions.toString(),
          ),
        ),
      ),)
    );
  }
}
