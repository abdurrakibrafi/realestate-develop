class AddResidencesModel {
  bool? success;
  String? message;
  Data? data;

  AddResidencesModel({this.success, this.message, this.data});

  AddResidencesModel.fromJson(Map<String, dynamic> json) {
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
  int? rent;
  Document? document;
  Location? location;
  Address? address;
  int? discount;
  String? discountCode;
  String? host;
  bool? isDeleted;
  String? sId;
  List<Images>? videos;
  int? iV;

  Data(
      {this.images,
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
      this.document,
      this.location,
      this.address,
      this.discount,
      this.discountCode,
      this.host,
      this.isDeleted,
      this.sId,
      this.videos,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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
    document =
        json['document'] != null ? Document.fromJson(json['document']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    discount = json['discount'];
    discountCode = json['discountCode'];
    host = json['host'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
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
    if (document != null) {
      data['document'] = document!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['discount'] = discount;
    data['discountCode'] = discountCode;
    data['host'] = host;
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
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
