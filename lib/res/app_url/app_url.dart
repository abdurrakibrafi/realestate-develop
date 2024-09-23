import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class AppUrl {
/*
  static const String baseUrl = "http://115.127.156.14:9005/api/v1";
  static const socketUrl = "http://115.127.156.14:9001";

  static const String baseUrl = "http://159.223.184.53:9005/api/v1";
  static const socketUrl = "http://159.223.184.53:9001";
*/

  static const String baseUrl = "http://estate.mamnon.de/api/v1";
  static const socketUrl = "http://159.223.184.53:9001";

  static Future<String> getUserId() async {
    UserPreference userPreference = UserPreference();
    String? userId = await userPreference.getId();
    return userId;
  }

  static const String bedroom = "";
  static const String loginUrl = "$baseUrl/auth/login";
  static const String createAcountUrl = "$baseUrl/users/create-user?$bedroom";
  static const String changePasswordUrl = "$baseUrl/auth/change-password";
  static const String forgetPasswordUrl = "$baseUrl/auth/forgot-password";
  static const String resetPasswordUrl = "$baseUrl/auth/reset-password";
  static const String otpVerifyUrl = "$baseUrl/otp/verify-otp";
  static const String otpResendUrl = "$baseUrl/otp/resend-otp";
  static const String adsUrl = "$baseUrl/ads";
  static const String createAdsUrl = "$baseUrl/ads/create-ad";

  static const String allFriends = "$baseUrl/chats/my-chat-list";
  static const String createChat = "$baseUrl/chats";
  static const String sendMessage = "$baseUrl/messages/send-messages";

  static const String payment = "$baseUrl/payments/initiate";
  static const String categories = "$baseUrl/categories";
  static const String bockingSignLandlord = "$baseUrl/booking-documents";
  static chatDetails(chatId) =>
      "$baseUrl/messages/?chat=$chatId&sort=createdAt";
  static bockingSignTenant(bookingId) =>
      "$baseUrl/booking-documents/$bookingId";

  static String residenceUrl(
      {String searchValue = '',
      String category = '',
      String page = '',
      String limit = '',
      String rooms = '',
      String governorate = '',
      String features = '',
      String rentingType = '',
      String budget = '',
      String host = ""}) {
    String residencesUrl =
        "${AppUrl.baseUrl}/residences?searchTerm=$searchValue&category=$category&page=$page&limit=$limit&rent=$budget&bedrooms=$rooms&rentType=$rentingType&features=$features&address.governorate=$governorate&host=$host&sort=totalReview";
    return residencesUrl;
  }

  static const String createResidencesUrl =
      "$baseUrl/residences/create-residence";
  static const String updateResidencesUrl = "$baseUrl/residences/update/";
  static const String deleteResidencesUrl = "$baseUrl/residences/";
  // static Future<String> get updateResidencesUrl async {
  //   String userId = await _getUserId();
  //   return "$baseUrl/residences/$userId";
  // }

  static const String favoriteUrl = "$baseUrl/favorite-items/my-favorite-items";
  static const String deleteFavoriteUrl = "$baseUrl/favorite-items/";

  static const String addFavoriteUrl =
      "$baseUrl/favorite-items/add-favorite-item";
  static const String createReviewUrl = "$baseUrl/review/create-review";
  static const String reviewUrl = "$baseUrl/review";
  static Future<String> get updateReviewUrl async {
    String userId = await getUserId();
    return "$baseUrl/review/update/$userId";
  }

  static const String addCat = "$baseUrl/ads-categories";

  static const String subscriptionsUrl = "$baseUrl/package";
  static Future<String> get subscriptionsByIdUrl async {
    String userId = await getUserId();
    return "$baseUrl/subscriptions/$userId";
  }

  static const String bookResidenceUrl = "$baseUrl/bookings";
  static const String myBookResidenceUrl = "$baseUrl/bookings/my-booking?sort=-createdAt&limit=999999999";
  static  String newBooking({userId}) => "$baseUrl/bookings?author=$userId";

  static const String myBookingResidenceUrl = "$baseUrl/bookings/my-booking";
  static const String bookingAcceptUrl = "$baseUrl/bookings/approved/";
  static const String bookingRejectUrl = "$baseUrl/bookings/cancel/";
  static Future<String> get bookingResidenceByIdUrl async {
    String userId = await getUserId();
    return "$baseUrl/bookings/$userId";
  }

  static const String initialPaymentUrl = "$baseUrl/payments/initiate";
  static const String webhooksPaymentUrl = "$baseUrl/payments/webhooks";
  static const String myPaymentUrl = "$baseUrl/payments/my-payments";
  static String myIncomeUrl({String yearValue = ''}) {
    String incomeUrl = "${AppUrl.baseUrl}/payments/my-income?year=$yearValue";
    return incomeUrl;
  }

  static const String maintenanceRequestUrl = "$baseUrl/maintenance-request";
  static const String createMaintenanceRequestUrl =
      "$baseUrl/maintenance-request/create-maintenanceRequest";
  static const String profileUrl = "$baseUrl/users/my-profile";
  static const String usersVerify = "$baseUrl/users/request-id-verify";
  static const String packageUrl = "$baseUrl/package";
  static const String mySubsriptionUrl =
      "$baseUrl/subscriptions/my-subscriptions";
  static const String notificationUrl = "$baseUrl/notifications/";

  static const String residenceBookingUrl = "$baseUrl/booking/";
}
