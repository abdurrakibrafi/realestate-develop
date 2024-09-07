class ResidencesModel {
  bool? success;
  String? message;
  Data? data;

  ResidencesModel({this.success, this.message, this.data});

  ResidencesModel.fromJson(Map<String, dynamic> json) {
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
  List<AllResidence>? allResidence;
  Meta? meta;

  Data({this.allResidence, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allResidence'] != null) {
      allResidence = <AllResidence>[];
      json['allResidence'].forEach((v) {
        allResidence!.add(AllResidence.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (allResidence != null) {
      data['allResidence'] = allResidence!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class AllResidence {
  Document? document;
  Location? location;
  Address? address;
  String? sId;
  List<Images>? images;
  Category? category;
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
  dynamic discount;
  String? discountCode;
  Host? host;
  bool? isDeleted;
  List<Images>? videos;
  dynamic averageRating;
  dynamic totalReview;

  AllResidence(
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
      this.averageRating,
      this.totalReview});

  AllResidence.fromJson(Map<String, dynamic> json) {
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
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
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
    host = json['host'] != null ? Host.fromJson(json['host']) : null;
    isDeleted = json['isDeleted'];
    if (json['videos'] != null) {
      videos = <Images>[];
      json['videos'].forEach((v) {
        videos!.add(Images.fromJson(v));
      });
    }
    averageRating = json['averageRating'];
    totalReview = json['totalReview'];
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
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
    if (host != null) {
      data['host'] = host!.toJson();
    }
    data['isDeleted'] = isDeleted;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['averageRating'] = averageRating;
    data['totalReview'] = totalReview;
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

class Category {
  String? sId;
  String? name;

  Category({this.sId, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}

class Host {
  String? sId;
  String? name;
  String? email;
  String? image;
  String? phoneNumber;
  String? verificationRequest;
  String? role;

  Host(
      {this.sId,
      this.name,
      this.email,
      this.image,
      this.phoneNumber,
      this.verificationRequest,
      this.role});

  Host.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phoneNumber = json['phoneNumber'];
    verificationRequest = json['verificationRequest'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['phoneNumber'] = phoneNumber;
    data['verificationRequest'] = verificationRequest;
    data['role'] = role;
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
