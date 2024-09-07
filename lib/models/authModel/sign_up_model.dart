class SignUpModel {
  bool? success;
  String? message;
  Data? data;

  SignUpModel({this.success, this.message, this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  OtpToken? otpToken;

  Data({this.user, this.otpToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    otpToken =
        json['OtpToken'] != null ? OtpToken.fromJson(json['OtpToken']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (otpToken != null) {
      data['OtpToken'] = otpToken!.toJson();
    }
    return data;
  }
}

class User {
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
  CivilId? civilId;
  String? verificationRequest;
  bool? isVerified;
  String? address;
  String? role;
  String? password;
  String? status;
  bool? needsPasswordChange;
  bool? isDeleted;
  Verification? verification;
  int? balance;
  String? about;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.username,
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
      this.civilId,
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
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
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
    civilId =
        json['civilId'] != null ? CivilId.fromJson(json['civilId']) : null;
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
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    if (civilId != null) {
      data['civilId'] = civilId!.toJson();
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
    data['_id'] = sId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
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

class OtpToken {
  String? token;

  OtpToken({this.token});

  OtpToken.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    return data;
  }
}
