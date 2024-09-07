class MaintenanceRequestModel {
  MaintenanceRequestModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory MaintenanceRequestModel.fromJson(Map<String, dynamic> json){
    return MaintenanceRequestModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.data,
    required this.meta,
  });

  final List<MRData> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<MRData>.from(json["data"]!.map((x) => MRData.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class MRData {
  MRData({
    required this.id,
    required this.user,
    required this.property,
    required this.problems,
    required this.status,
    required this.extraInfo,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final User? user;
  final Property? property;
  final String? problems;
  final String? status;
  final ExtraInfo? extraInfo;
  final List<dynamic> images;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MRData.fromJson(Map<String, dynamic> json){
    return MRData(
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      property: json["property"] == null ? null : Property.fromJson(json["property"]),
      problems: json["problems"],
      status: json["status"],
      extraInfo: json["extraInfo"] == null ? null : ExtraInfo.fromJson(json["extraInfo"]),
      images: json["images"] == null ? [] : List<dynamic>.from(json["images"]!.map((x) => x)),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class ExtraInfo {
  ExtraInfo({
    required this.name,
    required this.apartment,
    required this.floor,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.id,
  });

  final String? name;
  final String? apartment;
  final String? floor;
  final String? address;
  final String? email;
  final String? phoneNumber;
  final String? id;

  factory ExtraInfo.fromJson(Map<String, dynamic> json){
    return ExtraInfo(
      name: json["name"],
      apartment: json["apartment"],
      floor: json["floor"],
      address: json["address"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      id: json["_id"],
    );
  }

}

class Property {
  Property({
    required this.document,
    required this.location,
    required this.address,
    required this.id,
    required this.images,
    required this.videos,
    required this.category,
    required this.propertyName,
    required this.squareFeet,
    required this.bathrooms,
    required this.bedrooms,
    required this.residenceType,
    required this.propertyAbout,
    required this.features,
    required this.rentType,
    required this.paymentType,
    required this.deposit,
    required this.rent,
    required this.discount,
    required this.discountCode,
    required this.host,
    required this.averageRating,
    required this.totalBooking,
    required this.isDeleted,
    required this.v,
  });

  final Document? document;
  final Location? location;
  final Address? address;
  final String? id;
  final List<Image> images;
  final List<Image> videos;
  final String? category;
  final String? propertyName;
  final String? squareFeet;
  final String? bathrooms;
  final String? bedrooms;
  final String? residenceType;
  final String? propertyAbout;
  final List<String> features;
  final String? rentType;
  final String? paymentType;
  final String? deposit;
  final int? rent;
  final int? discount;
  final String? discountCode;
  final String? host;
  final int? averageRating;
  final int? totalBooking;
  final bool? isDeleted;
  final int? v;

  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
      document: json["document"] == null ? null : Document.fromJson(json["document"]),
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      address: json["address"] == null ? null : Address.fromJson(json["address"]),
      id: json["_id"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      videos: json["videos"] == null ? [] : List<Image>.from(json["videos"]!.map((x) => Image.fromJson(x))),
      category: json["category"],
      propertyName: json["propertyName"],
      squareFeet: json["squareFeet"],
      bathrooms: json["bathrooms"],
      bedrooms: json["bedrooms"],
      residenceType: json["residenceType"],
      propertyAbout: json["propertyAbout"],
      features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
      rentType: json["rentType"],
      paymentType: json["paymentType"],
      deposit: json["deposit"],
      rent: json["rent"],
      discount: json["discount"],
      discountCode: json["discountCode"],
      host: json["host"],
      averageRating: json["averageRating"],
      totalBooking: json["totalBooking"],
      isDeleted: json["isDeleted"],
      v: json["__v"],
    );
  }

}

class Address {
  Address({
    required this.governorate,
    required this.area,
    required this.block,
    required this.street,
    required this.house,
    required this.floor,
    required this.apartment,
    required this.avenue,
    required this.additionalDirections,
  });

  final String? governorate;
  final String? area;
  final String? block;
  final String? street;
  final String? house;
  final String? floor;
  final String? apartment;
  final String? avenue;
  final String? additionalDirections;

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      governorate: json["governorate"],
      area: json["area"],
      block: json["block"],
      street: json["street"],
      house: json["house"],
      floor: json["floor"],
      apartment: json["apartment"],
      avenue: json["avenue"],
      additionalDirections: json["additionalDirections"],
    );
  }

}

class Document {
  Document({
    required this.marriageCertificate,
    required this.salaryCertificate,
    required this.bankStatement,
    required this.passport,
  });

  final bool? marriageCertificate;
  final bool? salaryCertificate;
  final bool? bankStatement;
  final bool? passport;

  factory Document.fromJson(Map<String, dynamic> json){
    return Document(
      marriageCertificate: json["marriageCertificate"],
      salaryCertificate: json["salaryCertificate"],
      bankStatement: json["bankStatement"],
      passport: json["passport"],
    );
  }

}

class Image {
  Image({
    required this.url,
    required this.key,
    required this.id,
  });

  final String? url;
  final String? key;
  final String? id;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      url: json["url"],
      key: json["key"],
      id: json["_id"],
    );
  }

}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
    required this.type,
  });

  final double? latitude;
  final double? longitude;
  final String? type;

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      latitude: json["latitude"],
      longitude: json["longitude"],
      type: json["type"],
    );
  }

}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
    );
  }

}

class Meta {
  Meta({
    required this.page,
    required this.limit,
    required this.total,
    required this.totalPage,
  });

  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      page: json["page"],
      limit: json["limit"],
      total: json["total"],
      totalPage: json["totalPage"],
    );
  }

}
