import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:real_estate_management/controller/chat/message_controller.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/view/common/messagesScreens/payment_submit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/chat/message_send_controller.dart';
import '../../../controller/payment/payment_controller.dart';
import '../../../service/socket_service.dart';

class ChattingPage extends StatefulWidget {
  final String chatId;
  final String receiverId;
  final String receiverName;
  final String receiverImage;
  const ChattingPage({super.key, required this.chatId, required this.receiverId, required this.receiverName, required this.receiverImage});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final SocketService socketService = Get.put(SocketService());
  final MessageController messageChatController = Get.put(MessageController());
 final MessageSendController messageSendController = Get.put(MessageSendController());
  final ScrollController _scrollController = ScrollController();
  final PaymentRequestController paymentRequestController = Get.put(PaymentRequestController());

  String metaTitle = '';

  @override
  void initState() {
    socketService.init();
    socketService.socket.on('new-message::${widget.chatId}', (data) {
      print("sokect new message get >>>>>>>>>>>>>>>>>>>>>>>");
      _handleIncomingMessage(data);

    });
    socketService.socket.emit('seen',
        {
          'chatId': widget.chatId,

        }
    );
    messageChatController.getFriendshipChat(chatId: widget.chatId).then((_) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToEnd();
      });
    });
    super.initState();
  }

  void fetchMetaTitle({link}) async {
    try {
      final response = await http.get(Uri.parse(link));
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var titleElement = document.getElementsByTagName('title').first;
        setState(() {
          metaTitle = titleElement.text;
        });
      }
    } catch (e) {
      print('Failed to fetch meta title: $e');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  void _handleIncomingMessage(dynamic data) {
    /*if (data is Map<String, dynamic> && data.containsKey('id')) {
      socketService.messageList.add(data);
      print(socketService.messageList.length.toString()  + " $data    this is message list demo length");

    }*/
    socketService.messageList.add(data);
    print("${socketService.messageList.length}     this is message list demo length");
    _scrollToEnd();
  }


  @override
  Widget build(BuildContext context) {
    socketService.init().then((t){
      print("socked print ))))))))))))))))))))))))))))))))))");
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.receiverImage.toString(),
                      ))),
            ),
            const SizedBox(
              width: 10,
            ),
            commonText(widget.receiverName.toString(), size: 16, isBold: true),
          ],
        ),
        /*actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.menu),
          )
        ],*/
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      /*Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Icons.done_all,
            color: AppColor.primaryColor,
          ),
          commonText("14:30")
        ],
      ),*/
      body: Obx(() => messageChatController.isLoading.value == true? const Center(child: CircularProgressIndicator()): messageChatController.messageList.isEmpty? Center(
        child: commonText("No Data Found".tr),
      ) : ListView.builder(
        controller: _scrollController,
        itemCount: socketService.messageList.length,
        itemBuilder: (context, index) {
          // Parse the string to a DateTime object
        //  DateTime dateTime = DateTime.parse("${socketService.messageList[index]["sendTime"]}").toLocal();
          String formattedTime = DateFormat('d MMM yyyy - hh:mma').format(socketService.messageList[index]["sendTime"]?? DateTime.now());

          var userId = LocalStorage.getData(key: "userId");
          var senderId = socketService.messageList[index]["sender"];

          return Align(
            alignment: userId == senderId
                ? Alignment.topRight
                : Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
             //     socketService.messageList[index]["isPaymentLink"] == "pending"? const Text("You have received a payment link to finalize your booking",style: TextStyle(fontSize: 11),) : SizedBox(),
                  Container(
                      width: MediaQuery.sizeOf(context).width * 0.6,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 10, bottom: 5, left: 10),
                      decoration: BoxDecoration(
                        color: userId == senderId ?AppColor.whiteColor : AppColor.primaryColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: userId == senderId ? Radius.circular(10) : Radius.circular(0),
                          bottomRight:  userId == senderId ? Radius.circular(0) : socketService.messageList[index]["showButton"] == true ?Radius.circular(0) :Radius.circular(10),
                          topLeft: const Radius.circular(10),
                          topRight: const Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          socketService.messageList[index]["imageUrl"] == "" || socketService.messageList[index]["imageUrl"] == null?
                          const SizedBox() :
                              SizedBox(
                      height: 200,width: 300,
                                  child: Image.network(socketService.messageList[index]["imageUrl"].toString(),height: 200,width: 300,))
                         /* CachedNetworkImage(
                            imageUrl: socketService.messageList[index]["imageUrl"].toString(),
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  *//*  colorFilter:
                                    ColorFilter.mode(Colors.red, BlendMode.colorBurn)*//*
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>  Shimmer.fromColors(
                              baseColor: Colors.white10,
                              highlightColor: Colors.white,
                              child: const SizedBox(
                                width: 300.0,
                                height: 200.0,
                              ),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),*/,

                          socketService.messageList[index]["text"] == "" ?  const SizedBox() : socketService.messageList[index]["text"].contains('https://') || socketService.messageList[index]["text"].contains('http://') ? Text("This is a link >> \n${socketService.messageList[index]["text"]}")  : commonText(socketService.messageList[index]["text"].toString(), color: userId == senderId ? AppColor.blackColor:  AppColor.whiteColor),
                        ],
                      )),
                  socketService.messageList[index]["showButton"] == true ? Center(
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                    //  padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 0, bottom: 10, left: 10,right: 40),
                      child: GestureDetector(
                        onTap: (){
                          paymentRequestController.paymentRequest(bookingId: socketService.messageList[index]["bookingId"], BookingResidence: "BookingResidence");
                         // Get.dialog( UploadReceiptDialog(receiverId: widget.receiverId,));
                        },
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                              border: Border.all(color: AppColor.primaryColor),
                          ),
                          child: const Center(
                            child: Text("Click for payment",style: TextStyle(color: AppColor.whiteColor),),
                          ),
                        ),
                      ),
                    ),
                  ) : const SizedBox(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end, // Aligns content to the right
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,

                        children: [
                          Image.asset(
                            "assets/images/double_check.png",
                            scale: 4,
                          ),
                          const SizedBox(width: 4),
                          commonText(formattedTime,size: 12),// Space between the image and the text
                        ],
                      ),
                    ],
                  )

                ],
              ),
            ),
          );
        },
      ),),
      bottomNavigationBar: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(2, 2),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => messageSendController.selectedImagePath.value == ''
                    ? const SizedBox()
                    : Stack(
                  children: [
                    Image.file(File(messageSendController.selectedImagePath.value),height: 50,),
                    Positioned(
                        top: 0,
                        right: 0,
                        child:  InkWell(
                            onTap: (){
                              messageSendController.selectedImagePath.value = "";
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(Icons.close,color: Colors.red,size: 14,),
                            )))
                  ],
                )),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                       messageSendController.pickImage();
                      },
                      child:  Icon(
                        Icons.add_box_outlined,
                        color: AppColor.primaryColor.withOpacity(0.5),
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextFormField(

                        cursorColor: Colors.black,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.left,
                        textInputAction: TextInputAction.done,
                        minLines: 1,
                        controller: messageSendController.messageTextController,
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsetsDirectional.only(
                            start: 12,
                            end: 12,
                            top: 12,
                            bottom: 12,
                          ),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintText: "Type message",

                          hintStyle: GoogleFonts.raleway(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColor.primaryColor.withOpacity(0.5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColor.primaryColor.withOpacity(0.5),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: AppColor.primaryColor.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                   Obx(() => messageSendController.isLoading.value == false?  GestureDetector(
                     onTap: () {
                       if(messageSendController.messageTextController.text != "" || messageSendController.selectedImagePath.value != ""){
                         messageSendController.imageSend.value = true;
                        // messageSendController.selectedImagePath.value = "";
                         messageSendController.sendMessage(widget.receiverId, messageSendController.messageTextController.text, messageSendController.selectedImagePath.value).then((value) {
                           messageSendController.selectedImagePath.value = "";
                         //  fetchMetaTitle(link: messageController.text);
                           _scrollToEnd();
                         },);
                       }


                     },
                     child:   Icon(
                       Icons.send,
                       color: AppColor.primaryColor.withOpacity(0.5),
                       size: 20,
                     ),
                   ): const Icon(
                     Icons.send,
                     color: Colors.grey,
                     size: 20,
                   ),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
