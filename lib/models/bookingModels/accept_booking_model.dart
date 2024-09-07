class AcceptBookingModel {
  bool? success;
  String? message;
  Data? data;

  AcceptBookingModel({this.success, this.message, this.data});

  AcceptBookingModel.fromJson(Map<String, dynamic> json) {
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
  Guest? guest;
  String? sId;
  String? user;
  String? residence;
  String? startDate;
  String? endDate;
  int? totalPrice;
  String? author;
  int? discount;
  String? status;
  bool? isPaid;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.guest,
      this.sId,
      this.user,
      this.residence,
      this.startDate,
      this.endDate,
      this.totalPrice,
      this.author,
      this.discount,
      this.status,
      this.isPaid,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    guest = json['guest'] != null ? Guest.fromJson(json['guest']) : null;
    sId = json['_id'];
    user = json['user'];
    residence = json['residence'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalPrice = json['totalPrice'];
    author = json['author'];
    discount = json['discount'];
    status = json['status'];
    isPaid = json['isPaid'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (guest != null) {
      data['guest'] = guest!.toJson();
    }
    data['_id'] = sId;
    data['user'] = user;
    data['residence'] = residence;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['totalPrice'] = totalPrice;
    data['author'] = author;
    data['discount'] = discount;
    data['status'] = status;
    data['isPaid'] = isPaid;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Guest {
  int? child;
  int? adult;

  Guest({this.child, this.adult});

  Guest.fromJson(Map<String, dynamic> json) {
    child = json['child'];
    adult = json['adult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['child'] = child;
    data['adult'] = adult;
    return data;
  }
}
