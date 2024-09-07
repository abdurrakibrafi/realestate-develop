import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../service/socket_service.dart';
import '../../models/chat/chat_message_model.dart';
import '../../res/app_url/app_url.dart';
import '../../viewModel/controllers/user_preference/user_preference_view_model.dart';


class MessageController extends GetxController {
  final SocketService socketService = Get.put(SocketService());
  var isLoading = false.obs;

  var message = ChatMessagesModel().obs;
  var messageList = <ChatMessage>[].obs;


  ///friendshipChat sms

  Future<void> getFriendshipChat({
    required String chatId,

  }) async {
    try {
      isLoading(true);

      UserPreference userPreference = UserPreference();
      String token = await userPreference.getUser();
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token" ?? '',  // Handle possible null token
      };

      var response = await http.get(
        Uri.parse(AppUrl.chatDetails(chatId)),
        headers: headers.map((key, value) => MapEntry(key, value.toString())), // Cast values to strings
      );

      if (response.statusCode == 200) {
        messageList.clear();

        message.value = ChatMessagesModel.fromJson(jsonDecode(response.body));
        messageList.addAll(message.value.data!.data);
        print(messageList.length);

        socketService.messageList.clear();

        for (var i = 0; i < messageList.length; i++) {
          socketService.messageList.add(
              {
                "id": messageList[i].datumId.toString(),
                "text": messageList[i].text.toString(),
                "imageUrl": messageList[i].imageUrl.toString(),
                "seen":  messageList[i].seen,
                "sender": messageList[i].sender?.id.toString(),
                "receiver": messageList[i].receiver?.id.toString(),
                "isPaymentLink": messageList[i].isPaymentLink,
                "chat": messageList[i].chat.toString(),
                "_id": messageList[i].id.toString(),
                "showButton": messageList[i].showButton,
                "bookingId": messageList[i].bookingId,
                "sendTime": messageList[i].createdAt,
              }
          );


        }


      } else {
        var responseBody = jsonDecode(response.body);
        var errorMessage = responseBody['message'] ?? 'Something went wrong';

        // Show the error message using Get.snackbar
        Get.snackbar("Failed", errorMessage,);
      }
    } catch (e) {
      // Handle the exception as needed
      print(e.toString());
      // Example: kSnackBar(message: e.toString(), bgColor: failedColor);
    } finally {
      isLoading(false);
    }
  }
}
