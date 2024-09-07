class PaymentHistoryModel {
  bool? success;
  String? message;
  List<Data>? data;

  PaymentHistoryModel({this.success, this.message, this.data});

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? amount;
  String? status;
  String? transitionId;
  String? type;
  User? user;
  Details? details;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? landlordAmount;
  int? adminAmount;
  String? residenceAuthority;
  String? transitionDate;

  Data(
      {this.sId,
      this.amount,
      this.status,
      this.transitionId,
      this.type,
      this.user,
      this.details,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.landlordAmount,
      this.adminAmount,
      this.residenceAuthority,
      this.transitionDate});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    amount = json['amount'];
    status = json['status'];
    transitionId = json['transitionId'];
    type = json['type'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    landlordAmount = json['landlordAmount'];
    adminAmount = json['adminAmount'];
    residenceAuthority = json['residenceAuthority'];
    transitionDate = json['transitionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['amount'] = amount;
    data['status'] = status;
    data['transitionId'] = transitionId;
    data['type'] = type;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['landlordAmount'] = landlordAmount;
    data['adminAmount'] = adminAmount;
    data['residenceAuthority'] = residenceAuthority;
    data['transitionDate'] = transitionDate;
    return data;
  }
}

class User {
  String? image;
  String? sId;
  String? name;
  String? email;
  String? role;

  User({this.image, this.sId, this.name, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    return data;
  }
}

class Details {
  String? sId;
  int? price;
  String? startAt;
  String? expireAt;
  dynamic status;
  String? tranId;
  String? property;
  String? user;
  String? residence;
  String? startDate;
  String? endDate;
  int? totalPrice;
  ExtraInfo? extraInfo;
  dynamic isPaid;
  String? createdAt;
  String? updatedAt;
  String? author;
  String? package;
  String? transitionId;
  dynamic isActive;

  Details(
      {this.sId,
      this.price,
      this.startAt,
      this.expireAt,
      this.status,
      this.tranId,
      this.property,
      this.user,
      this.residence,
      this.startDate,
      this.endDate,
      this.totalPrice,
      this.extraInfo,
      this.isPaid,
      this.createdAt,
      this.updatedAt,
      this.author,
      this.package,
      this.transitionId,
      this.isActive});

  Details.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    startAt = json['startAt'];
    expireAt = json['expireAt'];
    status = json['status'];
    tranId = json['tranId'];
    property = json['property'];
    user = json['user'];
    residence = json['residence'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalPrice = json['totalPrice'];
    extraInfo = json['extraInfo'] != null
        ? ExtraInfo.fromJson(json['extraInfo'])
        : null;
    isPaid = json['isPaid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    author = json['author'];
    package = json['package'];
    transitionId = json['transitionId'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['price'] = price;
    data['startAt'] = startAt;
    data['expireAt'] = expireAt;
    data['status'] = status;
    data['tranId'] = tranId;
    data['property'] = property;
    data['user'] = user;
    data['residence'] = residence;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['totalPrice'] = totalPrice;
    if (extraInfo != null) {
      data['extraInfo'] = extraInfo!.toJson();
    }
    data['isPaid'] = isPaid;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['author'] = author;
    data['package'] = package;
    data['transitionId'] = transitionId;
    data['isActive'] = isActive;
    return data;
  }
}

class ExtraInfo {
  String? name;
  String? email;
  String? age;
  String? gender;
  String? phoneNumber;
  String? address;
  String? sId;

  ExtraInfo(
      {this.name,
      this.email,
      this.age,
      this.gender,
      this.phoneNumber,
      this.address,
      this.sId});

  ExtraInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['age'] = age;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['address'] = address;
    data['_id'] = sId;
    return data;
  }
}
