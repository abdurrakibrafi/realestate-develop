class AdsModel {
  bool? success;
  String? message;
  AdsData? adsData;

  AdsModel({this.success, this.message, this.adsData});

  AdsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    adsData = json['data'] != null ? AdsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (adsData != null) {
      data['data'] = adsData!.toJson();
    }
    return data;
  }
}

class AdsData {
  Meta? meta;
  List<Data>? data;

  AdsData({this.meta, this.data});

  AdsData.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int? page;
  int? limit;
  int? total;

  Meta({this.page, this.limit, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    limit = json['limit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['limit'] = limit;
    data['total'] = total;
    return data;
  }
}

class Data {
  String? sId;
  int? price;
  String? startAt;
  String? expireAt;
  bool? status;
  String? tranId;
  Property? property;
  bool? isDeleted;
  int? iV;

  Data(
      {this.sId,
      this.price,
      this.startAt,
      this.expireAt,
      this.status,
      this.tranId,
      this.property,
      this.isDeleted,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    price = json['price'];
    startAt = json['startAt'];
    expireAt = json['expireAt'];
    status = json['status'];
    tranId = json['tranId'];
    property =
        json['property'] != null ? Property.fromJson(json['property']) : null;
    isDeleted = json['isDeleted'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['price'] = price;
    data['startAt'] = startAt;
    data['expireAt'] = expireAt;
    data['status'] = status;
    data['tranId'] = tranId;
    if (property != null) {
      data['property'] = property!.toJson();
    }
    data['isDeleted'] = isDeleted;
    data['__v'] = iV;
    return data;
  }
}

class Property {
  String? sId;
  List<Images>? images;
  Category? category;
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
  Location? location;
  Host? host;
  int? popularity;
  bool? isDeleted;
  List<Images>? videos;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Property(
      {this.sId,
      this.images,
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
      this.location,
      this.host,
      this.popularity,
      this.isDeleted,
      this.videos,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Property.fromJson(Map<String, dynamic> json) {
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
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    host = json['host'] != null ? Host.fromJson(json['host']) : null;
    popularity = json['popularity'];
    isDeleted = json['isDeleted'];
    if (json['videos'] != null) {
      videos = <Images>[];
      json['videos'].forEach((v) {
        videos!.add(Images.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (host != null) {
      data['host'] = host!.toJson();
    }
    data['popularity'] = popularity;
    data['isDeleted'] = isDeleted;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
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

class Category {
  String? sId;
  String? name;
  bool? isDeleted;
  int? iV;

  Category({this.sId, this.name, this.isDeleted, this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    isDeleted = json['isDeleted'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['isDeleted'] = isDeleted;
    data['__v'] = iV;
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

class Host {
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
  BankInfo? bankInfo;
  Images? documents;
  String? verificationRequest;
  bool? isVerified;
  String? address;
  String? role;
  String? password;
  String? status;
  bool? needsPasswordChange;
  bool? isDeleted;
  Verification? verification;
  double? balance;
  String? about;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Host(
      {this.sId,
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
      this.bankInfo,
      this.documents,
      this.verificationRequest,
      this.isVerified,
      this.address,
      this.role,
      this.password,
      this.status,
      this.needsPasswordChange,
      this.isDeleted,
      this.verification,
      this.balance,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Host.fromJson(Map<String, dynamic> json) {
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
    bankInfo =
        json['bankInfo'] != null ? BankInfo.fromJson(json['bankInfo']) : null;
    documents =
        json['documents'] != null ? Images.fromJson(json['documents']) : null;
    verificationRequest = json['verificationRequest'];
    isVerified = json['isVerified'];
    address = json['address'];
    role = json['role'];
    password = json['password'];
    status = json['status'];
    needsPasswordChange = json['needsPasswordChange'];
    isDeleted = json['isDeleted'];
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
    balance = json['balance'];
    about = json['about'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (bankInfo != null) {
      data['bankInfo'] = bankInfo!.toJson();
    }
    if (documents != null) {
      data['documents'] = documents!.toJson();
    }
    data['verificationRequest'] = verificationRequest;
    data['isVerified'] = isVerified;
    data['address'] = address;
    data['role'] = role;
    data['password'] = password;
    data['status'] = status;
    data['needsPasswordChange'] = needsPasswordChange;
    data['isDeleted'] = isDeleted;
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    data['balance'] = balance;
    data['about'] = about;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class BankInfo {
  String? country;
  String? bankName;
  String? accountHolder;
  String? swiftCode;
  String? accountNumber;
  String? bankAddress;

  BankInfo(
      {this.country,
      this.bankName,
      this.accountHolder,
      this.swiftCode,
      this.accountNumber,
      this.bankAddress});

  BankInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    bankName = json['bankName'];
    accountHolder = json['accountHolder'];
    swiftCode = json['swiftCode'];
    accountNumber = json['accountNumber'];
    bankAddress = json['bankAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['bankName'] = bankName;
    data['accountHolder'] = accountHolder;
    data['swiftCode'] = swiftCode;
    data['accountNumber'] = accountNumber;
    data['bankAddress'] = bankAddress;
    return data;
  }
}

class Documents {
  String? selfie;
  String? documentType;
  List<Documents>? documents;
  String? sId;

  Documents({this.selfie, this.documentType, this.documents, this.sId});

  Documents.fromJson(Map<String, dynamic> json) {
    selfie = json['selfie'];
    documentType = json['documentType'];
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['selfie'] = selfie;
    data['documentType'] = documentType;
    if (documents != null) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['_id'] = sId;
    return data;
  }
}

class Verification {
  String? otp;
  String? expiresAt;
  bool? status;

  Verification({this.otp, this.expiresAt, this.status});

  Verification.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    expiresAt = json['expiresAt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['expiresAt'] = expiresAt;
    data['status'] = status;
    return data;
  }
}
