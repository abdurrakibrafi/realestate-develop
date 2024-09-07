import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:real_estate_management/data/app_exceptions.dart';
import 'package:real_estate_management/data/network/base_api_services.dart';
import 'package:real_estate_management/view/common/signinSignupScreens/signin_screens/signin_page.dart';
import 'package:real_estate_management/viewModel/controllers/user_preference/user_preference_view_model.dart';

class NetworkApiServices extends BaseApiServices {
  final Dio _dio = Dio();

  @override
  Future<dynamic> getApi(String url) async {
    log(url);
    dynamic responseJson;
    UserPreference userPreference = UserPreference();
    String token = await userPreference.getUser();
    String language = await userPreference.getLanguage();
    try {
      final response = await _dio
          .get(
            url,
            options: Options(headers: {
              "Authorization": "Bearer $token",
              "Accept-Language": language
            }),
          )
          .timeout(const Duration(seconds: 20));
      responseJson = returnResponse(response);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw RequestTimeOutException("");
      } else if (e.error is SocketException) {
        throw InternetException("");
      } else {
        rethrow;
      }
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    log("Request URL: $url");
    UserPreference userPreference = UserPreference();
    String token = await userPreference.getUser();
    String language = await userPreference.getLanguage();
    try {
      final response = await _dio
          .post(
            url,
            data: data,
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "token": token,
                "Content-Type": data is FormData
                    ? "multipart/form-data"
                    : "application/json",
                "Accept-Language": language
              },
            ),
          )
          .timeout(const Duration(seconds: 20));

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");

      return returnResponse(response);
    } on DioException catch (e) {
      log("Error: ${e.toString()}");
      String errorMessage = "An error occurred";
      if (e.type == DioExceptionType.badResponse) {
        log("Detailed Error: ${e.response?.data}");
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ?? errorMessage;
        } else {
          errorMessage = e.response!.data.toString();
        }
      }

      throw Exception(errorMessage);
    }
  }

  @override
  Future<dynamic> patchApi(var data, String url) async {
    log("Patch Request URL: $url");
    if (data is! FormData) {
      log("Patch Request Data: ${jsonEncode(data)}");
    } else {
      log("Patch Request Data: FormData cannot be JSON encoded");
    }

    UserPreference userPreference = UserPreference();
    String token = await userPreference.getUser();
    String language = await userPreference.getLanguage();

    try {
      final response = await _dio
          .patch(
            url,
            data: data,
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "token": token,
                "Content-Type": data is FormData
                    ? "multipart/form-data"
                    : "application/json",
                "Accept-Language": language
              },
            ),
          )
          .timeout(const Duration(seconds: 20));

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");
      return returnResponse(response);
    } on DioException catch (e) {
      log("Patch Error: ${e.toString()}");
      // if (e.type == DioExceptionType.badResponse) {
      //   log("Patch Detailed Error: ${e.response?.data}");
      //   throw Exception(e.response?.data);
      // } else {
      //   rethrow;
      // }
    }
  }

  @override
  Future<dynamic> deleteApi(String url) async {
    log("Delete Request URL: $url");
    UserPreference userPreference = UserPreference();
    String token = await userPreference.getUser();
    String language = await userPreference.getLanguage();

    try {
      final response = await _dio
          .delete(
            url,
            options: Options(
              headers: {
                "Authorization": "Bearer $token",
                "Accept-Language": language,
              },
            ),
          )
          .timeout(const Duration(seconds: 20));

      log("Response Status: ${response.statusCode}");
      log("Response Data: ${response.data}");
      return returnResponse(response);
    } on DioException catch (e) {
      log("Delete Error: ${e.toString()}");
      String errorMessage = "An error occurred";
      if (e.type == DioExceptionType.badResponse) {
        log("Detailed Error: ${e.response?.data}");
        if (e.response?.data is Map<String, dynamic>) {
          errorMessage = e.response?.data['message'] ?? errorMessage;
        } else {
          errorMessage = e.response!.data.toString();
        }
      }
      throw Exception(errorMessage);
    }
  }

  dynamic returnResponse(Response response) {
    UserPreference userPreference = UserPreference();
    log(response.statusCode.toString());
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 400:
        throw InvalidSyntaxException("Bad Request");
      case 401:
        userPreference.removeUser().then((value) {
          Get.offAll(const SigninPage());
        });
        throw UnauthorizedException("Unauthorized");
      case 403:
        throw ForbiddenException("Forbidden");
      case 404:
        throw NotFoundException("Not Found");
      case 409:
        throw ConflictException("Conflict");
      case 429:
        throw TooManyRequestsException("Too Many Requests");
      case 500:
        throw InternalServerErrorException("Internal Server Error");
      case 501:
        throw NotImplementedException("Not Implemented");
      case 502:
        throw BadGatewayException("Bad Gateway");
      case 503:
        throw ServiceUnavailableException("Service Unavailable");
      case 504:
        throw GatewayTimeoutException("Gateway Timeout");
      default:
        throw FetchDataException(
            "Error occurred with StatusCode: ${response.statusCode}");
    }
  }
}
