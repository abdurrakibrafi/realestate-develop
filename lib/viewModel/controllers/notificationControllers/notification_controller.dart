import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:real_estate_management/models/notificationModels/notification_model.dart';
import 'package:real_estate_management/repository/notificationRepository/notification_repository.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';
import 'package:real_estate_management/utils/utils.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class NotificationController extends GetxController {
  final _api = NotificationRepository();
  final RxList<Data> adsDataList = <Data>[].obs;
  var isLoading = true.obs;

  final StreamController<List<Data>> _notificationListStreamController =
      StreamController<List<Data>>.broadcast();
  Stream<List<Data>> get notificationsStream =>
      _notificationListStreamController.stream;

  late io.Socket socket;
  UserPreference userPreference = UserPreference();

  @override
  void onInit() {
    super.onInit();
    // if (adsDataList.isNotEmpty) {
    //   // If the list already has data, emit it immediately
    //   _notificationListStreamController.add(List.from(adsDataList));
    // } else {
    //   fetchData(); // Fetch data if the list is empty
    // }
    // connectAndListen();

    fetchData();
  }

  void connectAndListen() {
    socket = io.io(AppUrl.socketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();

    socket.onConnect((_) {
      log('Connected to socket');
    });

    socket.on('notification::${userPreference.getId()}', (data) {
      log('Notification received: $data');
      var json = data as Map<String, dynamic>;
      NotificationsModel newNotification = NotificationsModel.fromJson(json);
      if (newNotification.data != null && newNotification.success == true) {
        adsDataList.addAll(newNotification.data!);
        _notificationListStreamController
            .add(List.from(adsDataList)); // Use a copy of the list
      }
    });
  }

  void fetchData() async {
    if (adsDataList.isEmpty) {
      isLoading(true); // Only show loading if it's the first fetch
    }
    try {
      NotificationsModel notificationModel = await _api.notificationApi();
      if (notificationModel.data != null && notificationModel.success == true) {
        adsDataList.assignAll(notificationModel.data!);
        _notificationListStreamController
            .add(List.from(adsDataList)); // Use a copy of the list
      } else {
        Utils.snackBar("Error", "Failed to fetch data or no data available");
      }
    } catch (e) {
      log(e.toString());
      //Utils.snackBar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    socket.disconnect();
    _notificationListStreamController.close();
    super.onClose();
  }
}
