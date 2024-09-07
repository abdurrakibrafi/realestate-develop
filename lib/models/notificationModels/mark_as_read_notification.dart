class MarkAsReadNotification {
  bool? success;
  String? message;
  Data? data;

  MarkAsReadNotification({this.success, this.message, this.data});

  MarkAsReadNotification.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
  int? modifiedCount;
  var upsertedId;
  int? upsertedCount;
  int? matchedCount;

  Data(
      {this.acknowledged,
      this.modifiedCount,
      this.upsertedId,
      this.upsertedCount,
      this.matchedCount});

  Data.fromJson(Map<String, dynamic> json) {
    acknowledged = json['acknowledged'];
    modifiedCount = json['modifiedCount'];
    upsertedId = json['upsertedId'];
    upsertedCount = json['upsertedCount'];
    matchedCount = json['matchedCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['acknowledged'] = acknowledged;
    data['modifiedCount'] = modifiedCount;
    data['upsertedId'] = upsertedId;
    data['upsertedCount'] = upsertedCount;
    data['matchedCount'] = matchedCount;
    return data;
  }
}
