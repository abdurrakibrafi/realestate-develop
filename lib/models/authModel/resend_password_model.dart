class ResetPasswordModel {
  bool? success;
  String? message;
  Data? data;

  ResetPasswordModel({this.success, this.message, this.data});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
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

  Data(
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
      this.needsPasswordChange,
      this.isDeleted,
      this.balance,
      this.about,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
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

class Documents {
  String? selfie;
  String? documentType;
  List<Document>? document;
  String? sId;

  Documents({this.selfie, this.documentType, this.document, this.sId});

  Documents.fromJson(Map<String, dynamic> json) {
    selfie = json['selfie'];
    documentType = json['documentType'];
    if (json['document'] != null) {
      document = <Document>[];
      json['document'].forEach((v) {
        document!.add(Document.fromJson(v));
      });
    }
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['selfie'] = selfie;
    data['documentType'] = documentType;
    if (document != null) {
      data['document'] = document!.map((v) => v.toJson()).toList();
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
