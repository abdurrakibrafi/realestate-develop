class MyIncomeModel {
  bool? success;
  String? message;
  Data? data;

  MyIncomeModel({this.success, this.message, this.data});

  MyIncomeModel.fromJson(Map<String, dynamic> json) {
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
  int? totalMyIncome;
  List<MonthlyIncome>? monthlyIncome;
  List<HalfYearlyIncome>? halfYearlyIncome;
  HalfYearlyIncome? yearlyIncome;
  List<TotalTransitions>? totalTransitions;

  Data(
      {this.totalMyIncome,
      this.monthlyIncome,
      this.halfYearlyIncome,
      this.yearlyIncome,
      this.totalTransitions});

  Data.fromJson(Map<String, dynamic> json) {
    totalMyIncome = json['totalMyIncome'];
    if (json['monthlyIncome'] != null) {
      monthlyIncome = <MonthlyIncome>[];
      json['monthlyIncome'].forEach((v) {
        monthlyIncome!.add(MonthlyIncome.fromJson(v));
      });
    }
    if (json['halfYearlyIncome'] != null) {
      halfYearlyIncome = <HalfYearlyIncome>[];
      json['halfYearlyIncome'].forEach((v) {
        halfYearlyIncome!.add(HalfYearlyIncome.fromJson(v));
      });
    }
    yearlyIncome = json['yearlyIncome'] != null
        ? HalfYearlyIncome.fromJson(json['yearlyIncome'])
        : null;
    if (json['totalTransitions'] != null) {
      totalTransitions = <TotalTransitions>[];
      json['totalTransitions'].forEach((v) {
        totalTransitions!.add(TotalTransitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalMyIncome'] = totalMyIncome;
    if (monthlyIncome != null) {
      data['monthlyIncome'] = monthlyIncome!.map((v) => v.toJson()).toList();
    }
    if (halfYearlyIncome != null) {
      data['halfYearlyIncome'] =
          halfYearlyIncome!.map((v) => v.toJson()).toList();
    }
    if (yearlyIncome != null) {
      data['yearlyIncome'] = yearlyIncome!.toJson();
    }
    if (totalTransitions != null) {
      data['totalTransitions'] =
          totalTransitions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MonthlyIncome {
  String? month;
  int? income;

  MonthlyIncome({this.month, this.income});

  MonthlyIncome.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['month'] = month;
    data['income'] = income;
    return data;
  }
}

class HalfYearlyIncome {
  String? period;
  int? income;

  HalfYearlyIncome({this.period, this.income});

  HalfYearlyIncome.fromJson(Map<String, dynamic> json) {
    period = json['period'];
    income = json['income'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['period'] = period;
    data['income'] = income;
    return data;
  }
}

class TotalTransitions {
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
  String? residenceAuthority;
  int? adminAmount;
  int? landlordAmount;

  TotalTransitions(
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
      this.residenceAuthority,
      this.adminAmount,
      this.landlordAmount});

  TotalTransitions.fromJson(Map<String, dynamic> json) {
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
    residenceAuthority = json['residenceAuthority'];
    adminAmount = json['adminAmount'];
    landlordAmount = json['landlordAmount'];
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
    data['residenceAuthority'] = residenceAuthority;
    data['adminAmount'] = adminAmount;
    data['landlordAmount'] = landlordAmount;
    return data;
  }
}

class User {
  String? image;
  String? sId;
  String? name;
  String? email;

  User({this.image, this.sId, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}

class Details {
  String? sId;
  String? user;
  Residence? residence;
  String? startDate;
  String? endDate;
  int? totalPrice;
  ExtraInfo? extraInfo;
  bool? isPaid;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? author;

  Details(
      {this.sId,
      this.user,
      this.residence,
      this.startDate,
      this.endDate,
      this.totalPrice,
      this.extraInfo,
      this.isPaid,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.author});

  Details.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    residence = json['residence'] != null
        ? Residence.fromJson(json['residence'])
        : null;
    startDate = json['startDate'];
    endDate = json['endDate'];
    totalPrice = json['totalPrice'];
    extraInfo = json['extraInfo'] != null
        ? ExtraInfo.fromJson(json['extraInfo'])
        : null;
    isPaid = json['isPaid'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['user'] = user;
    if (residence != null) {
      data['residence'] = residence!.toJson();
    }
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['totalPrice'] = totalPrice;
    if (extraInfo != null) {
      data['extraInfo'] = extraInfo!.toJson();
    }
    data['isPaid'] = isPaid;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['author'] = author;
    return data;
  }
}

class Residence {
  String? sId;
  List<Images>? images;
  List<Images>? videos;
  String? category;
  String? propertyName;
  String? propertyAbout;
  String? squareFeet;
  String? bedrooms;
  String? bathrooms;
  String? rules;
  String? shortTerm;
  String? longTerm;
  String? rentType;
  String? price;
  Address? address;
  String? paci;
  List<String>? facilities;
  String? instructions;
  String? hostName;
  String? hostAbout;
  String? ads;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? host;

  Residence(
      {this.sId,
      this.images,
      this.videos,
      this.category,
      this.propertyName,
      this.propertyAbout,
      this.squareFeet,
      this.bedrooms,
      this.bathrooms,
      this.rules,
      this.shortTerm,
      this.longTerm,
      this.rentType,
      this.price,
      this.address,
      this.paci,
      this.facilities,
      this.instructions,
      this.hostName,
      this.hostAbout,
      this.ads,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.host});

  Residence.fromJson(Map<String, dynamic> json) {
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
    propertyAbout = json['propertyAbout'];
    squareFeet = json['squareFeet'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    rules = json['rules'];
    shortTerm = json['shortTerm'];
    longTerm = json['longTerm'];
    rentType = json['rentType'];
    price = json['price'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    paci = json['paci'];
    facilities = json['facilities'].cast<String>();
    instructions = json['instructions'];
    hostName = json['hostName'];
    hostAbout = json['hostAbout'];
    ads = json['ads'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    host = json['host'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['category'] = category;
    data['propertyName'] = propertyName;
    data['propertyAbout'] = propertyAbout;
    data['squareFeet'] = squareFeet;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['rules'] = rules;
    data['shortTerm'] = shortTerm;
    data['longTerm'] = longTerm;
    data['rentType'] = rentType;
    data['price'] = price;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['paci'] = paci;
    data['facilities'] = facilities;
    data['instructions'] = instructions;
    data['hostName'] = hostName;
    data['hostAbout'] = hostAbout;
    data['ads'] = ads;
    data['isDeleted'] = isDeleted;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['host'] = host;
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
  String? state;
  String? area;
  String? block;
  String? street;
  String? house;
  String? floor;
  String? apartment;
  String? sId;

  Address(
      {this.state,
      this.area,
      this.block,
      this.street,
      this.house,
      this.floor,
      this.apartment,
      this.sId});

  Address.fromJson(Map<String, dynamic> json) {
    state = json['state'];
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
    data['state'] = state;
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
