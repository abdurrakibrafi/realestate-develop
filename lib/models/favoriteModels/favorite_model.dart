class FavoriteModel {
  bool? success;
  String? message;
  Data? data;

  FavoriteModel({this.success, this.message, this.data});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
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
  List<AllFavoriteItems>? allFavoriteItems;
  Meta? meta;

  Data({this.allFavoriteItems, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allFavoriteItems'] != null) {
      allFavoriteItems = <AllFavoriteItems>[];
      json['allFavoriteItems'].forEach((v) {
        allFavoriteItems!.add(AllFavoriteItems.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allFavoriteItems != null) {
      data['allFavoriteItems'] =
          allFavoriteItems!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class AllFavoriteItems {
  String? sId;
  Residence? residence;
  User? user;
  int? iV;
  AvgRating? avgRating;

  AllFavoriteItems(
      {this.sId, this.residence, this.user, this.iV, this.avgRating});

  AllFavoriteItems.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    residence = json['residence'] != null
        ? Residence.fromJson(json['residence'])
        : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    iV = json['__v'];
    avgRating = json['avgRating'] != null
        ? AvgRating.fromJson(json['avgRating'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (residence != null) {
      data['residence'] = residence!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['__v'] = iV;
    if (avgRating != null) {
      data['avgRating'] = avgRating!.toJson();
    }
    return data;
  }
}

class Residence {
  Document? document;
  Location? location;
  Address? address;
  String? sId;
  List<Images>? images;
  String? category;
  String? propertyName;
  String? squareFeet;
  String? bathrooms;
  String? bedrooms;
  String? residenceType;
  String? propertyAbout;
  List<String>? features;
  String? rentType;
  String? paymentType;
  String? deposit;
  dynamic rent;
  dynamic? discount;
  String? discountCode;
  String? host;
  bool? isDeleted;
  List<Images>? videos;
  dynamic? iV;

  Residence(
      {this.document,
      this.location,
      this.address,
      this.sId,
      this.images,
      this.category,
      this.propertyName,
      this.squareFeet,
      this.bathrooms,
      this.bedrooms,
      this.residenceType,
      this.propertyAbout,
      this.features,
      this.rentType,
      this.paymentType,
      this.deposit,
      this.rent,
      this.discount,
      this.discountCode,
      this.host,
      this.isDeleted,
      this.videos,
      this.iV});

  Residence.fromJson(Map<String, dynamic> json) {
    document =
        json['document'] != null ? Document.fromJson(json['document']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    sId = json['_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    category = json['category'];
    propertyName = json['propertyName'];
    squareFeet = json['squareFeet'];
    bathrooms = json['bathrooms'];
    bedrooms = json['bedrooms'];
    residenceType = json['residenceType'];
    propertyAbout = json['propertyAbout'];
    features = json['features'].cast<String>();
    rentType = json['rentType'];
    paymentType = json['paymentType'];
    deposit = json['deposit'];
    rent = json['rent'];
    discount = json['discount'];
    discountCode = json['discountCode'];
    host = json['host'];
    isDeleted = json['isDeleted'];
    if (json['videos'] != null) {
      videos = <Images>[];
      json['videos'].forEach((v) {
        videos!.add(Images.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (document != null) {
      data['document'] = document!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['_id'] = sId;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
    data['propertyName'] = propertyName;
    data['squareFeet'] = squareFeet;
    data['bathrooms'] = bathrooms;
    data['bedrooms'] = bedrooms;
    data['residenceType'] = residenceType;
    data['propertyAbout'] = propertyAbout;
    data['features'] = features;
    data['rentType'] = rentType;
    data['paymentType'] = paymentType;
    data['deposit'] = deposit;
    data['rent'] = rent;
    data['discount'] = discount;
    data['discountCode'] = discountCode;
    data['host'] = host;
    data['isDeleted'] = isDeleted;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['__v'] = iV;
    return data;
  }
}

class Document {
  bool? marriageCertificate;
  bool? salaryCertificate;
  bool? bankStatement;
  bool? passport;

  Document(
      {this.marriageCertificate,
      this.salaryCertificate,
      this.bankStatement,
      this.passport});

  Document.fromJson(Map<String, dynamic> json) {
    marriageCertificate = json['marriageCertificate'];
    salaryCertificate = json['salaryCertificate'];
    bankStatement = json['bankStatement'];
    passport = json['passport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['marriageCertificate'] = marriageCertificate;
    data['salaryCertificate'] = salaryCertificate;
    data['bankStatement'] = bankStatement;
    data['passport'] = passport;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;
  String? type;

  Location({this.latitude, this.longitude, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['type'] = type;
    return data;
  }
}

class Address {
  String? governorate;
  String? area;
  String? house;
  String? apartment;
  String? floor;
  String? street;
  String? block;
  String? avenue;
  String? additionalDirections;

  Address(
      {this.governorate,
      this.area,
      this.house,
      this.apartment,
      this.floor,
      this.street,
      this.block,
      this.avenue,
      this.additionalDirections});

  Address.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    area = json['area'];
    house = json['house'];
    apartment = json['apartment'];
    floor = json['floor'];
    street = json['street'];
    block = json['block'];
    avenue = json['avenue'];
    additionalDirections = json['additionalDirections'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['governorate'] = governorate;
    data['area'] = area;
    data['house'] = house;
    data['apartment'] = apartment;
    data['floor'] = floor;
    data['street'] = street;
    data['block'] = block;
    data['avenue'] = avenue;
    data['additionalDirections'] = additionalDirections;
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

class User {
  BankInfo? bankInfo;
  Verification? verification;
  String? sId;
  String? username;
  String? name;
  String? email;
  String? image;
  String? phoneNumber;
  String? phoneCode;
  String? nationality;
  String? maritalStatus;
  String? gender;
  String? dateOfBirth;
  String? job;
  String? monthlyIncome;
  String? verificationRequest;
  bool? isVerified;
  String? address;
  String? role;
  String? status;
  bool? needsPasswordChange;
  bool? isDeleted;
  dynamic balance;
  String? about;
  String? createdAt;
  String? updatedAt;
  dynamic iV;
  String? passwordChangedAt;

  User(
      {this.bankInfo,
      this.verification,
      this.sId,
      this.username,
      this.name,
      this.email,
      this.image,
      this.phoneNumber,
      this.phoneCode,
      this.nationality,
      this.maritalStatus,
      this.gender,
      this.dateOfBirth,
      this.job,
      this.monthlyIncome,
      this.verificationRequest,
      this.isVerified,
      this.address,
      this.role,
      this.status,
      this.needsPasswordChange,
      this.isDeleted,
      this.balance,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.passwordChangedAt});

  User.fromJson(Map<String, dynamic> json) {
    bankInfo =
        json['bankInfo'] != null ? BankInfo.fromJson(json['bankInfo']) : null;
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phoneNumber = json['phoneNumber'];
    phoneCode = json['phoneCode'];
    nationality = json['nationality'];
    maritalStatus = json['maritalStatus'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    job = json['job'];
    monthlyIncome = json['monthlyIncome'];
    verificationRequest = json['verificationRequest'];
    isVerified = json['isVerified'];
    address = json['address'];
    role = json['role'];
    status = json['status'];
    needsPasswordChange = json['needsPasswordChange'];
    isDeleted = json['isDeleted'];
    balance = json['balance'];
    about = json['about'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    passwordChangedAt = json['passwordChangedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bankInfo != null) {
      data['bankInfo'] = bankInfo!.toJson();
    }
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    data['_id'] = sId;
    data['username'] = username;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['phoneNumber'] = phoneNumber;
    data['phoneCode'] = phoneCode;
    data['nationality'] = nationality;
    data['maritalStatus'] = maritalStatus;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['job'] = job;
    data['monthlyIncome'] = monthlyIncome;
    data['verificationRequest'] = verificationRequest;
    data['isVerified'] = isVerified;
    data['address'] = address;
    data['role'] = role;
    data['status'] = status;
    data['needsPasswordChange'] = needsPasswordChange;
    data['isDeleted'] = isDeleted;
    data['balance'] = balance;
    data['about'] = about;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['passwordChangedAt'] = passwordChangedAt;
    return data;
  }
}

class BankInfo {
  String? country;
  String? bankName;
  String? swiftCode;
  String? accountHolder;
  String? accountNumber;
  String? bankAddress;

  BankInfo(
      {this.country,
      this.bankName,
      this.swiftCode,
      this.accountHolder,
      this.accountNumber,
      this.bankAddress});

  BankInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    bankName = json['bankName'];
    swiftCode = json['swiftCode'];
    accountHolder = json['accountHolder'];
    accountNumber = json['accountNumber'];
    bankAddress = json['bankAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['bankName'] = bankName;
    data['swiftCode'] = swiftCode;
    data['accountHolder'] = accountHolder;
    data['accountNumber'] = accountNumber;
    data['bankAddress'] = bankAddress;
    return data;
  }
}

class Verification {
  bool? status;

  Verification({this.status});

  Verification.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    return data;
  }
}

class AvgRating {
  dynamic averageRating;
  dynamic totalReview;

  AvgRating({this.averageRating, this.totalReview});

  AvgRating.fromJson(Map<String, dynamic> json) {
    averageRating = json['averageRating'];
    totalReview = json['totalReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['averageRating'] = averageRating;
    data['totalReview'] = totalReview;
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
