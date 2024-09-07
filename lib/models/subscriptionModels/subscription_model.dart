class SubscriptionModel {
  bool? success;
  String? message;
  Data? data;

  SubscriptionModel({this.success, this.message, this.data});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
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
  List<SubscriptionData>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <SubscriptionData>[];
      json['data'].forEach((v) {
        data!.add(SubscriptionData.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class SubscriptionData {
  String? sId;
  String? name;
  int? price;
  int? durationDays;
  List<String>? features;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  SubscriptionData(
      {this.sId,
      this.name,
      this.price,
      this.durationDays,
      this.features,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  SubscriptionData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    durationDays = json['durationDays'];
    features = json['features'].cast<String>();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['price'] = price;
    data['durationDays'] = durationDays;
    data['features'] = features;
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
