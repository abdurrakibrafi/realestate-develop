class CreateMaintenanceRequestModel {
  bool? success;
  String? message;
  Data? data;

  CreateMaintenanceRequestModel({this.success, this.message, this.data});

  CreateMaintenanceRequestModel.fromJson(Map<String, dynamic> json) {
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
  String? user;
  String? property;
  String? problems;
  List<Images>? images;
  String? status;
  ExtraInfo? extraInfo;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.user,
      this.property,
      this.problems,
      this.images,
      this.status,
      this.extraInfo,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    property = json['property'];
    problems = json['problems'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    status = json['status'];
    extraInfo = json['extraInfo'] != null
        ? ExtraInfo.fromJson(json['extraInfo'])
        : null;
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['property'] = property;
    data['problems'] = problems;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    if (extraInfo != null) {
      data['extraInfo'] = extraInfo!.toJson();
    }
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Images {
  String? url;
  String? key;
  String? sId;

  Images({this.url, this.key, this.sId});

  Images.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    key = json['key'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['key'] = key;
    data['_id'] = sId;
    return data;
  }
}

class ExtraInfo {
  String? name;
  String? apartment;
  String? floor;
  String? address;
  String? email;
  String? phoneNumber;
  String? sId;

  ExtraInfo(
      {this.name,
      this.apartment,
      this.floor,
      this.address,
      this.email,
      this.phoneNumber,
      this.sId});

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    apartment = json['apartment'];
    floor = json['floor'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['apartment'] = apartment;
    data['floor'] = floor;
    data['address'] = address;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['_id'] = sId;
    return data;
  }
}
