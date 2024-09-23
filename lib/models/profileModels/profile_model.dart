class ProfileModel {
  bool? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  Verification? verification;
  String? phoneCode;
  String? address;
  String? about;
  String? sId;
  String? username;
  String? name;
  String? nameArabic;
  String? email;
  String? image;
  String? phoneNumber;
  String? nationality;
  String? maritalStatus;
  String? gender;
  String? dateOfBirth;
  String? job;
  String? monthlyIncome;
  CivilId? civilId;
  String? verificationRequest;
  bool? isVerified;
  String? role;
  String? status;
  bool? needsPasswordChange;
  bool? isDeleted;
  dynamic? balance;
  String? createdAt;
  String? updatedAt;
  dynamic? iV;

  Data(
      {this.verification,
      this.phoneCode,
      this.address,
      this.about,
      this.sId,
      this.username,
      this.name,
      this.nameArabic,
      this.email,
      this.image,
      this.phoneNumber,
      this.nationality,
      this.maritalStatus,
      this.gender,
      this.dateOfBirth,
      this.job,
      this.monthlyIncome,
      this.civilId,
      this.verificationRequest,
      this.isVerified,
      this.role,
      this.status,
      this.needsPasswordChange,
      this.isDeleted,
      this.balance,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    verification = json['verification'] != null
        ? Verification.fromJson(json['verification'])
        : null;
    phoneCode = json['phoneCode'];
    address = json['address'];
    about = json['about'];
    sId = json['_id'];
    username = json['username'];
    name = json['name'];
    nameArabic = json['nameArabic'];
    email = json['email'];
    image = json['image'];
    phoneNumber = json['phoneNumber'];
    nationality = json['nationality'];
    maritalStatus = json['maritalStatus'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    job = json['job'];
    monthlyIncome = json['monthlyIncome'];
    civilId =
        json['civilId'] != null ? CivilId.fromJson(json['civilId']) : null;
    verificationRequest = json['verificationRequest'];
    isVerified = json['isVerified'];
    role = json['role'];
    status = json['status'];
    needsPasswordChange = json['needsPasswordChange'];
    isDeleted = json['isDeleted'];
    balance = json['balance'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (verification != null) {
      data['verification'] = verification!.toJson();
    }
    data['phoneCode'] = phoneCode;
    data['address'] = address;
    data['about'] = about;
    data['_id'] = sId;
    data['username'] = username;
    data['name'] = name;
    data['nameArabic'] = nameArabic;
    data['email'] = email;
    data['image'] = image;
    data['phoneNumber'] = phoneNumber;
    data['nationality'] = nationality;
    data['maritalStatus'] = maritalStatus;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['job'] = job;
    data['monthlyIncome'] = monthlyIncome;
    if (civilId != null) {
      data['civilId'] = civilId!.toJson();
    }
    data['verificationRequest'] = verificationRequest;
    data['isVerified'] = isVerified;
    data['role'] = role;
    data['status'] = status;
    data['needsPasswordChange'] = needsPasswordChange;
    data['isDeleted'] = isDeleted;
    data['balance'] = balance;
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

class CivilId {
  String? frontSide;
  String? backSide;
  String? sId;

  CivilId({this.frontSide, this.backSide, this.sId});

  CivilId.fromJson(Map<String, dynamic> json) {
    frontSide = json['frontSide'];
    backSide = json['backSide'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['frontSide'] = frontSide;
    data['backSide'] = backSide;
    data['_id'] = sId;
    return data;
  }
}
