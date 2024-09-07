import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate_management/controller/chat/message_send_controller.dart';
import 'dart:convert';

import '../../../../service/socket_service.dart';
import '../../models/chat/all_friends_model.dart';
import '../../res/app_url/app_url.dart';
import '../../view/common/messagesScreens/chatting_page.dart';
import '../../view/guest/guest_root_screen.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';

class FriendController extends GetxController {
  final SocketService socketService = Get.put(SocketService());
  final MessageSendController messageSendController = Get.put(MessageSendController());
  var isLoading = false.obs;

  var friends = AllFriendModel(data: []).obs;
  var friendList = <Friends>[].obs;

  @override
  void onInit() {
    getAllFriends();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllFriends();
  }


  Future<void> createChat({required String senderId, required String receiverId}) async {
    // Request body
    final body = {
      "participants": [senderId, receiverId]
    };

    try {

      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();

      print(AppUrl.createChat);
      // Sending the POST request
      final response = await http.post(
        Uri.parse(AppUrl.createChat),
        headers: {
          'Content-Type': 'application/json',
         "Authorization": "Bearer $token" ?? ''

        },
        body: jsonEncode(body),
      );
      print(jsonEncode(body));
      var responseBody = json.decode(response.body);
      print(responseBody);
      // Check for a successful response
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = json.decode(response.body);
        print(responseBody);  // Log the full response

        final participants = responseBody["data"]["participants"];
        if (participants is List && participants.length > 1) {
          Get.to(ChattingPage(
            chatId: responseBody["data"]["_id"],
            receiverId: receiverId,
            receiverName: participants[1]["name"],
            receiverImage: participants[1]["image"],
          ));
        } else {
          print("Unexpected structure in participants data.");
        }
      } else {
        print("Failed to create chat: ${response.body}");
      }
    } catch (e) {
      // Handle the exception
      print("An error occurred: $e");
    }
  }

  /// Get all Friends
  Future<void> getAllFriends() async {
    UserPreference userPreference = UserPreference();
    String token = await userPreference.getUser();
    try {
      isLoading(true);

      var headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer $token"
      };

      var url = Uri.parse(AppUrl.allFriends);

      var response = await http.get(url, headers: headers);

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);

        friendList.clear();

        friends.value = AllFriendModel.fromJson(responseBody);
        friendList.addAll(friends.value.data);
        print(
            "###################### get friends ${friendList.length} #######################");

        socketService.friendList.clear();

        if (friendList.isNotEmpty) {
          for (var i = 0; i < friendList.length; i++) {
            if (friendList[i].chat?.participants.isNotEmpty ?? false) {
              socketService.friendList.add({
                "id": friendList[i].chat?.id,
                "username": friendList[i].chat?.participants[0].username,
                "receiverId": friendList[i].chat?.participants[0].id,
                "name": friendList[i].chat?.participants[0].name.toString(),
                "email": friendList[i].chat?.participants[0].email.toString(),
                "image": friendList[i].chat?.participants[0].image.toString(),
                "phoneNumber": friendList[i].chat?.participants[0].phoneNumber,
                "role": friendList[i].chat?.participants[0].role,
                "last_message_text": friendList[i].message?.text,
                "last_message_image": friendList[i].message?.imageUrl,
                "unreadMessageCount": friendList[i].unreadMessageCount,
              });
              print("###################### socket $i #######################");
            } else {
              print("Participants list is empty for friend $i");
            }
          }
        } else {
          print("Friend list is empty");
        }

        print(
            "###################### get friends Socket ${socketService.friendList.length} %%%%%%%%%%%%%%%%%%%%%");

        isLoading(false);
      } else {
        throw 'Unable to load all friends data!';
      }
    } catch (e) {
      // Schedule the snackbar to show after the current frame is rendered
      print(e);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      });
    } finally {
      isLoading(false);
    }
  }
}
