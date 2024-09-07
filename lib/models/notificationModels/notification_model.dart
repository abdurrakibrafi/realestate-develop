class NotificationsModel {
  bool? success;
  String? message;
  List<Data>? data;
  Meta? meta;

  NotificationsModel({this.success, this.message, this.data, this.meta});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? receiver;
  String? refference;
  String? modelType;
  String? message;
  String? description;
  bool? read;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.receiver,
      this.refference,
      this.modelType,
      this.message,
      this.description,
      this.read,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    receiver = json['receiver'];
    refference = json['refference'];
    modelType = json['model_type'];
    message = json['message'];
    description = json['description'];
    read = json['read'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['receiver'] = receiver;
    data['refference'] = refference;
    data['model_type'] = modelType;
    data['message'] = message;
    data['description'] = description;
    data['read'] = read;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({this.page, this.limit, this.total, this.totalPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    data['totalPage'] = totalPage;
    return data;
  }
}
