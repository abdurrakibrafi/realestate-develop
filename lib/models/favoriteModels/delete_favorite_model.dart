// ignore_for_file: unnecessary_new

class DeleteFavoriteModel {
  bool? success;
  String? message;
  Data? data;

  DeleteFavoriteModel({this.success, this.message, this.data});

  DeleteFavoriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? acknowledged;
  int? deletedCount;

  Data({this.acknowledged, this.deletedCount});

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    deletedCount = json['deletedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acknowledged'] = acknowledged;
    data['deletedCount'] = deletedCount;
    return data;
  }
}
