class MyBookingModel {
  bool? success;
  String? message;
  List<Data>? data;

  MyBookingModel({this.success, this.message, this.data});

  MyBookingModel.fromJson(Map<String, dynamic> json) {
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
  Guest? guest;
  String? sId;
  String? user;
  Residence? residence;
  String? startDate;
  String? endDate;
  int? totalPrice;
  Author? author;
  int? discount;
  String? status;
  bool? isPaid;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? averageRating;

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
      this.iV,
      this.averageRating});

  Data.fromJson(Map<String, dynamic> json) {
    guest = json['guest'] != null ? Guest.fromJson(json['guest']) : null;
    sId = json['_id'];
    user = json['user'];
    residence = json['residence'] != null
        ? Residence.fromJson(json['residence'])
        : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalPrice = json['totalPrice'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    discount = json['discount'];
    status = json['status'];
    isPaid = json['isPaid'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    averageRating = json['averageRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (guest != null) {
      data['guest'] = guest!.toJson();
    }
    data['_id'] = sId;
    data['user'] = user;
    if (residence != null) {
      data['residence'] = residence!.toJson();
    }
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['totalPrice'] = totalPrice;
    if (author != null) {
      data['author'] = author!.toJson();
    }
    data['discount'] = discount;
    data['status'] = status;
    data['isPaid'] = isPaid;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['averageRating'] = averageRating;
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
  int? rent;
  int? discount;
  String? discountCode;
  String? host;
  bool? isDeleted;
  List<Images>? videos;
  int? iV;

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

class Author {
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
  Images? documents;
  String? verificationRequest;
  bool? isVerified;
  String? address;
  String? role;
  String? status;
  int? balance;
  String? about;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Author(
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
      this.documents,
      this.verificationRequest,
      this.isVerified,
      this.address,
      this.role,
      this.status,
      this.balance,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Author.fromJson(Map<String, dynamic> json) {
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
    documents =
        json['documents'] != null ? Images.fromJson(json['documents']) : null;
    verificationRequest = json['verificationRequest'];
    isVerified = json['isVerified'];
    address = json['address'];
    role = json['role'];
    status = json['status'];
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
    if (documents != null) {
      data['documents'] = documents!.toJson();
    }
    data['verificationRequest'] = verificationRequest;
    data['isVerified'] = isVerified;
    data['address'] = address;
    data['role'] = role;
    data['status'] = status;
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
