import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/components/common_text.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: commonText("Tutorials".tr,size: 16),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.0,vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText("Tips & Tutorials".tr,color: AppColor.primaryColor,size: 18,isBold: true),
              SizedBox(height: 5,),
              commonText("Access essential tips".tr,color: AppColor.lightGreyColor,size: 13),
              SizedBox(height: 10,),
              Container(
                height: Get.height * 0.15,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xff263238).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // shadow color
                      spreadRadius: 5, // spread radius
                      blurRadius: 5, // blur radius
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 7),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: [
                          commonText("Tips For Landlords".tr,color: AppColor.blackColor,size: 15,isBold: true),
                          commonText("Learn how to set".tr,color: AppColor.blackColor,size: 12),
                        ],
                      ),
                      SizedBox(width: 10,),
                      Container(
                        height: Get.height,
                        width: Get.width / 4,
                        decoration: BoxDecoration(
                          color: Color(0xff263238).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset("assets/images/play.png",fit: BoxFit.fill,),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
          
              CustomExpansionTile(
                title: 'How do I get started with the app?',
              ),
              CustomExpansionTile(
                title: 'Is there a fee to use the app?',
              ),
              CustomExpansionTile(
                title: 'How are tenants vetted?',
              ),
              CustomExpansionTile(
                title: 'What payment methods are available?',
              ),
              SizedBox(height: 10,),
              commonText("Need more help?",color: AppColor.blackColor,size: 14,isBold: true),
              SizedBox(height: 5,),
              commonText("Need more help?If you have other questions, don't hesitate to contact us. we're here to assist you!",color: AppColor.lightGreyColor,size: 13),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Center(child: Image.asset("assets/icons/common/whatsapp.png"),),backgroundColor: Colors.transparent,),
    );
  }
}

class CustomExpansionTile extends StatelessWidget {
  final String title;

  CustomExpansionTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange,
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Your detailed answer goes here.'),
            ),
          ],
        ),
      ),
    );
  }
}