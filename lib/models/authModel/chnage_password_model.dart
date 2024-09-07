class ChangePasswordModel {
  bool? success;
  String? message;
  Data? data;

  ChangePasswordModel({this.success, this.message, this.data});

  ChangePasswordModel.fromJson(Map<String, dynamic> json) {
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
  BankInfo? bankInfo;
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
  Documents? documents;
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
  String? passwordChangedAt;

  Data(
      {this.bankInfo,
      this.verification,
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
      this.needsPasswordChange,
      this.isDeleted,
      this.balance,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.passwordChangedAt});

  Data.fromJson(Map<String, dynamic> json) {
    bankInfo =
        json['bankInfo'] != null ? BankInfo.fromJson(json['bankInfo']) : null;
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
    documents = json['documents'] != null
        ? Documents.fromJson(json['documents'])
        : null;
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
    passwordChangedAt = json['passwordChangedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bankInfo != null) {
      data['bankInfo'] = bankInfo!.toJson();
    }
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
    data['needsPasswordChange'] = needsPasswordChange;
    data['isDeleted'] = isDeleted;
    data['balance'] = balance;
    data['about'] = about;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['passwordChangedAt'] = passwordChangedAt;
    return data;
  }
}

class BankInfo {
  String? country;
  String? bankName;
  String? swiftCode;
  String? accountHolder;
  String? accountNumber;
  String? bankAddress;

  BankInfo(
      {this.country,
      this.bankName,
      this.swiftCode,
      this.accountHolder,
      this.accountNumber,
      this.bankAddress});

  BankInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    bankName = json['bankName'];
    swiftCode = json['swiftCode'];
    accountHolder = json['accountHolder'];
    accountNumber = json['accountNumber'];
    bankAddress = json['bankAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['bankName'] = bankName;
    data['swiftCode'] = swiftCode;
    data['accountHolder'] = accountHolder;
    data['accountNumber'] = accountNumber;
    data['bankAddress'] = bankAddress;
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
  List<Document>? documents;
  String? sId;

  Documents({this.selfie, this.documentType, this.documents, this.sId});

  Documents.fromJson(Map<String, dynamic> json) {
    selfie = json['selfie'];
    documentType = json['documentType'];
    if (json['documents'] != null) {
      documents = <Document>[];
      json['documents'].forEach((v) {
        documents!.add(Document.fromJson(v));
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

class Document {
  String? key;
  String? url;
  String? sId;

  Document({this.key, this.url, this.sId});

  Document.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    url = json['url'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['url'] = url;
    data['_id'] = sId;
    return data;
  }
}
