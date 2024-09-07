class NewBookingModel {
  NewBookingModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory NewBookingModel.fromJson(Map<String, dynamic> json){
    return NewBookingModel(
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

  final List<Datum> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Datum {
  Datum({
    required this.guest,
    required this.id,
    required this.user,
    required this.residence,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.author,
    required this.discount,
    required this.status,
    required this.isPaid,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
  });

  final Guest? guest;
  final String? id;
  final User? user;
  final Residence? residence;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? totalPrice;
  final String? author;
  final int? discount;
  final String? status;
  final bool? isPaid;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json){
    return Datum(
      guest: json["guest"] == null ? null : Guest.fromJson(json["guest"]),
      id: json["_id"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
      residence: json["residence"] == null ? null : Residence.fromJson(json["residence"]),
      startDate: DateTime.tryParse(json["startDate"] ?? ""),
      endDate: DateTime.tryParse(json["endDate"] ?? ""),
      totalPrice: json["totalPrice"],
      author: json["author"],
      discount: json["discount"],
      status: json["status"],
      isPaid: json["isPaid"],
      isDeleted: json["isDeleted"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Guest {
  Guest({
    required this.child,
    required this.adult,
  });

  final int? child;
  final int? adult;

  factory Guest.fromJson(Map<String, dynamic> json){
    return Guest(
      child: json["child"],
      adult: json["adult"],
    );
  }

}

class Residence {
  Residence({
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
  final User? host;
  final int? averageRating;
  final int? totalBooking;
  final bool? isDeleted;
  final int? v;

  factory Residence.fromJson(Map<String, dynamic> json){
    return Residence(
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
      host: json["host"] == null ? null : User.fromJson(json["host"]),
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

class User {
  User({
    required this.verification,
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.image,
    required this.phoneNumber,
    required this.phoneCode,
    required this.nationality,
    required this.maritalStatus,
    required this.gender,
    required this.dateOfBirth,
    required this.job,
    required this.monthlyIncome,
    required this.verificationRequest,
    required this.isVerified,
    required this.address,
    required this.role,
    required this.status,
    required this.tenants,
    required this.balance,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalProperties,
    required this.documents,
  });

  final Verification? verification;
  final String? id;
  final String? username;
  final String? name;
  final String? email;
  final String? image;
  final String? phoneNumber;
  final String? phoneCode;
  final String? nationality;
  final String? maritalStatus;
  final String? gender;
  final DateTime? dateOfBirth;
  final String? job;
  final String? monthlyIncome;
  final String? verificationRequest;
  final bool? isVerified;
  final String? address;
  final String? role;
  final String? status;
  final String? tenants;
  final int? balance;
  final String? about;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? totalProperties;
  final Documents? documents;

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      verification: json["verification"] == null ? null : Verification.fromJson(json["verification"]),
      id: json["_id"],
      username: json["username"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      phoneNumber: json["phoneNumber"],
      phoneCode: json["phoneCode"],
      nationality: json["nationality"],
      maritalStatus: json["maritalStatus"],
      gender: json["gender"],
      dateOfBirth: DateTime.tryParse(json["dateOfBirth"] ?? ""),
      job: json["job"],
      monthlyIncome: json["monthlyIncome"],
      verificationRequest: json["verificationRequest"],
      isVerified: json["isVerified"],
      address: json["address"],
      role: json["role"],
      status: json["status"],
      tenants: json["tenants"],
      balance: json["balance"],
      about: json["about"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      totalProperties: json["totalProperties"],
      documents: json["documents"] == null ? null : Documents.fromJson(json["documents"]),
    );
  }

}

class Documents {
  Documents({
    required this.selfie,
    required this.documentType,
    required this.documents,
    required this.id,
  });

  final String? selfie;
  final String? documentType;
  final List<Image> documents;
  final String? id;

  factory Documents.fromJson(Map<String, dynamic> json){
    return Documents(
      selfie: json["selfie"],
      documentType: json["documentType"],
      documents: json["documents"] == null ? [] : List<Image>.from(json["documents"]!.map((x) => Image.fromJson(x))),
      id: json["_id"],
    );
  }

}

class Image {
  Image({
    required this.key,
    required this.url,
    required this.id,
  });

  final String? key;
  final String? url;
  final String? id;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      key: json["key"],
      url: json["url"],
      id: json["_id"],
    );
  }

}

class Verification {
  Verification({
    required this.status,
  });

  final bool? status;

  factory Verification.fromJson(Map<String, dynamic> json){
    return Verification(
      status: json["status"],
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
