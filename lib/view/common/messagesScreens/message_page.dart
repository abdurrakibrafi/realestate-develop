import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_management/res/components/common_text.dart';
import 'package:real_estate_management/res/colors/colors.dart';
import 'package:real_estate_management/res/assets/images.dart';
import 'package:real_estate_management/res/components/layoutManagement/no_data_layout.dart';
import 'package:real_estate_management/service/local_storage.dart';
import 'package:real_estate_management/utils/app_constant.dart';
import 'package:real_estate_management/view/common/messagesScreens/chatting_page.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';

import '../../../controller/chat/all_friend_controller.dart';
import '../../../service/socket_service.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final SocketService socketService = Get.put(SocketService());
  final FriendController friendController = Get.put(FriendController());
  final  TextEditingController searchTextController = TextEditingController();
  String search = '';

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (LocalStorage.getData(key: AppConstant.token) == null) {
        Get.off(() => SigninPage(), transition: Transition.fade);
      }else{

      }
    });

    print(socketService.onlineUserList);
    socketService.init();
    super.initState();

    socketService.socket.on('onlineUser', (data) {
      socketService.onlineUserList.clear();
      for (var element in data) {
        if (element is String) {
          socketService.onlineUserList.add(element);
        }
      }
      print("last user active on server: : ${socketService.onlineUserList.length}");
      print("last user : ${socketService.onlineUserList}");
      //friendController.getAllFriends();
      // _handleIncomingFriends(data);
    });


    Future.delayed(Duration.zero, () {
      friendController.getAllFriends();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          title: commonText("Messages".tr,
              size: 16, isBold: true, color: AppColor.darkGreyColor),
          centerTitle: true,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 80),
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 30),
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 248, 248),
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: TextField(
                controller: searchTextController,
                onChanged: (String? value) {
                  setState(() {
                    search = value.toString();
                  });
                },
                enabled: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(2.0),
                  hintText: "Search for a Property".tr,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColor.darkGreyColor,
                  ),
                  border: InputBorder.none,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ImageIcon(
                      AssetImage("assets/icons/searchIcon.png"),
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
          await  friendController.getAllFriends();
          },
          child: Obx(() =>friendController.isLoading.value == true
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : friendController.friendList.isEmpty
              ? emptyListView()
              :  ListView.builder(
              itemCount: socketService.friendList.length,
              itemBuilder: (context, index) {
                String position = socketService.friendList[index]["name"].toString();
                if(searchTextController.text.isEmpty){
                  return GestureDetector(
                    onTap: () {
                      Get.to(ChattingPage(chatId: socketService.friendList[index]["id"], receiverId: socketService.friendList[index]["receiverId"], receiverName: socketService.friendList[index]["name"], receiverImage: socketService.friendList[index]["image"],));
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorLight,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Stack(
                                    children: [
                                      ClipOval(
                                        child:  Image.network(
                                          "${socketService.friendList[index]["image"] ?? "https://edulaveworldschool.com/wp-content/uploads/2022/11/pngtree-man-vector-icon-png-image_470295.jpg"}",
                                          width: 55,
                                          height: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      // Positioned(
                                      //   right: 4,
                                      //   bottom: 1,
                                      //   child: Container(
                                      //     width: 12,
                                      //     height: 12,
                                      //     decoration: BoxDecoration(
                                      //       color: AppColor.primaryColor,
                                      //       shape: BoxShape.circle,
                                      //       border: Border.all(
                                      //         color: Colors.white,
                                      //         width: 2.0,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        commonText("${socketService.friendList[index]["name"]}",
                                            size: 14, isBold: true),
                                        socketService.friendList[index]["unreadMessageCount"].toString() != "0"?      Container(
                                            margin: EdgeInsets.only(left: 8.0),
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                              color: AppColor.primaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: commonText("${socketService.friendList[index]["unreadMessageCount"]}",
                                                color: AppColor.whiteColor)): SizedBox()
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 4.0),
                                          child: Icon(
                                            Icons.done_all,
                                            color: AppColor.primaryColor,
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: commonText(
                                              "${socketService.friendList[index]["last_message_text"]}",
                                              maxLines: 1,
                                              size: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(radius: 8,backgroundColor: socketService.onlineUserList.contains(socketService.friendList[index]["receiverId"])? Colors.green : Colors.red,)
                          ],
                        ),
                      ),
                    ),
                  );
                }else if(position.toLowerCase().contains(searchTextController.text.toLowerCase())){
                  return GestureDetector(
                    onTap: () {
                      Get.to(ChattingPage(chatId: socketService.friendList[index]["id"], receiverId: socketService.friendList[index]["receiverId"], receiverName: socketService.friendList[index]["name"], receiverImage: socketService.friendList[index]["image"],));
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColorLight,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Stack(
                                    children: [
                                      ClipOval(
                                        child: Image.network(
                                          "${socketService.friendList[index]["image"]}",
                                          width: 55,
                                          height: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      // Positioned(
                                      //   right: 4,
                                      //   bottom: 1,
                                      //   child: Container(
                                      //     width: 12,
                                      //     height: 12,
                                      //     decoration: BoxDecoration(
                                      //       color: AppColor.primaryColor,
                                      //       shape: BoxShape.circle,
                                      //       border: Border.all(
                                      //         color: Colors.white,
                                      //         width: 2.0,
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        commonText("${socketService.friendList[index]["name"]}",
                                            size: 14, isBold: true),
                                        socketService.friendList[index]["unreadMessageCount"].toString() != "0"?      Container(
                                            margin: EdgeInsets.only(left: 8.0),
                                            padding: const EdgeInsets.all(6),
                                            decoration: const BoxDecoration(
                                              color: AppColor.primaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: commonText("${socketService.friendList[index]["unreadMessageCount"]}",
                                                color: AppColor.whiteColor)): SizedBox()
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 4.0),
                                          child: Icon(
                                            Icons.done_all,
                                            color: AppColor.primaryColor,
                                            size: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: commonText(
                                              "${socketService.friendList[index]["last_message_text"]}",
                                              maxLines: 1,
                                              size: 10),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                            CircleAvatar(radius: 8,backgroundColor: socketService.onlineUserList.contains(socketService.friendList[index]["receiverId"])? Colors.green : Colors.red,)
                          ],
                        ),
                      ),
                    ),
                  );
                }else {
                  return Container();
                }


              })),
        )
    );
  }
}
