class RatingModel {
  bool? success;
  String? message;
  RatingData? ratingData;

  RatingModel({this.success, this.message, this.ratingData});

  RatingModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    ratingData =
        json['data'] != null ? RatingData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (ratingData != null) {
      data['data'] = ratingData!.toJson();
    }
    return data;
  }
}

class RatingData {
  List<Data>? data;
  Meta? meta;

  RatingData({this.data, this.meta});

  RatingData.fromJson(Map<String, dynamic> json) {
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
  User? user;
  Residence? residence;
  int? rating;
  List<Images>? images;
  String? comment;
  bool? isDeleted;

  Data(
      {this.sId,
      this.user,
      this.residence,
      this.rating,
      this.images,
      this.comment,
      this.isDeleted});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    residence = json['residence'] != null
        ? Residence.fromJson(json['residence'])
        : null;
    rating = json['rating'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    comment = json['comment'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (residence != null) {
      data['residence'] = residence!.toJson();
    }
    data['rating'] = rating;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['comment'] = comment;
    data['isDeleted'] = isDeleted;
    return data;
  }
}

class User {
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
  int? balance;
  String? about;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.verification,
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
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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

class Residence {
  Location? location;
  String? sId;
  List<Images>? images;
  List<Images>? videos;
  String? category;
  String? propertyName;
  String? squareFeet;
  String? bathrooms;
  String? bedrooms;
  List<String>? features;
  String? rentType;
  String? residenceType;
  int? perNightPrice;
  int? perMonthPrice;
  String? propertyAbout;
  Address? address;
  int? paciNo;
  String? rules;
  int? discount;
  String? discountCode;
  String? host;
  int? popularity;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Residence(
      {this.location,
      this.sId,
      this.images,
      this.videos,
      this.category,
      this.propertyName,
      this.squareFeet,
      this.bathrooms,
      this.bedrooms,
      this.features,
      this.rentType,
      this.residenceType,
      this.perNightPrice,
      this.perMonthPrice,
      this.propertyAbout,
      this.address,
      this.paciNo,
      this.rules,
      this.discount,
      this.discountCode,
      this.host,
      this.popularity,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Residence.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    sId = json['_id'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <Images>[];
      json['videos'].forEach((v) {
        videos!.add(Images.fromJson(v));
      });
    }
    category = json['category'];
    propertyName = json['propertyName'];
    squareFeet = json['squareFeet'];
    bathrooms = json['bathrooms'];
    bedrooms = json['bedrooms'];
    features = json['features'].cast<String>();
    rentType = json['rentType'];
    residenceType = json['residenceType'];
    perNightPrice = json['perNightPrice'];
    perMonthPrice = json['perMonthPrice'];
    propertyAbout = json['propertyAbout'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    paciNo = json['paciNo'];
    rules = json['rules'];
    discount = json['discount'];
    discountCode = json['discountCode'];
    host = json['host'];
    popularity = json['popularity'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['_id'] = sId;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
    data['propertyName'] = propertyName;
    data['squareFeet'] = squareFeet;
    data['bathrooms'] = bathrooms;
    data['bedrooms'] = bedrooms;
    data['features'] = features;
    data['rentType'] = rentType;
    data['residenceType'] = residenceType;
    data['perNightPrice'] = perNightPrice;
    data['perMonthPrice'] = perMonthPrice;
    data['propertyAbout'] = propertyAbout;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['paciNo'] = paciNo;
    data['rules'] = rules;
    data['discount'] = discount;
    data['discountCode'] = discountCode;
    data['host'] = host;
    data['popularity'] = popularity;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;
  List<double>? coordinates;
  String? type;

  Location({this.latitude, this.longitude, this.coordinates, this.type});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['coordinates'] = coordinates;
    data['type'] = type;
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

class Address {
  String? governorate;
  String? area;
  String? block;
  String? street;
  String? house;
  String? floor;
  String? apartment;
  String? sId;

  Address(
      {this.governorate,
      this.area,
      this.block,
      this.street,
      this.house,
      this.floor,
      this.apartment,
      this.sId});

  Address.fromJson(Map<String, dynamic> json) {
    governorate = json['governorate'];
    area = json['area'];
    block = json['block'];
    street = json['street'];
    house = json['house'];
    floor = json['floor'];
    apartment = json['apartment'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['governorate'] = governorate;
    data['area'] = area;
    data['block'] = block;
    data['street'] = street;
    data['house'] = house;
    data['floor'] = floor;
    data['apartment'] = apartment;
    data['_id'] = sId;
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
