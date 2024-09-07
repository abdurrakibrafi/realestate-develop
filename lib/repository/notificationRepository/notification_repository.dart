import 'dart:developer';

import 'package:real_estate_management/data/network/network_api_services.dart';
import 'package:real_estate_management/models/notificationModels/mark_as_read_notification.dart';
import 'package:real_estate_management/models/notificationModels/notification_model.dart';
import 'package:real_estate_management/res/app_url/app_url.dart';

class NotificationRepository {
  final _apiService = NetworkApiServices();

  Future<NotificationsModel> notificationApi() async {
    String notificationUrl = AppUrl.notificationUrl;
    dynamic response = await _apiService.getApi(notificationUrl);
    log(response.toString());

    return NotificationsModel.fromJson(response);
  }

  Future<MarkAsReadNotification> markAsReadNotificationApi() async {
    String notificationUrl = AppUrl.notificationUrl;
    dynamic response = await _apiService.patchApi({}, notificationUrl);
    log(response.toString());

    return MarkAsReadNotification.fromJson(response);
  }
}
