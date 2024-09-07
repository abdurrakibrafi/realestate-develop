class VerifyIdentityModel {
  VerifyIdentityModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory VerifyIdentityModel.fromJson(Map<String, dynamic> json){
    return VerifyIdentityModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.verification,
    required this.id,
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
    required this.needsPasswordChange,
    required this.isDeleted,
    required this.tenants,
    required this.registerWith,
    required this.balance,
    required this.about,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.documents,
  });

  final Verification? verification;
  final String? id;
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
  final bool? needsPasswordChange;
  final bool? isDeleted;
  final String? tenants;
  final String? registerWith;
  final int? balance;
  final String? about;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final Documents? documents;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      verification: json["verification"] == null ? null : Verification.fromJson(json["verification"]),
      id: json["_id"],
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
      needsPasswordChange: json["needsPasswordChange"],
      isDeleted: json["isDeleted"],
      tenants: json["tenants"],
      registerWith: json["registerWith"],
      balance: json["balance"],
      about: json["about"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
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
  final List<Document> documents;
  final String? id;

  factory Documents.fromJson(Map<String, dynamic> json){
    return Documents(
      selfie: json["selfie"],
      documentType: json["documentType"],
      documents: json["documents"] == null ? [] : List<Document>.from(json["documents"]!.map((x) => Document.fromJson(x))),
      id: json["_id"],
    );
  }

}

class Document {
  Document({
    required this.key,
    required this.url,
    required this.id,
  });

  final String? key;
  final String? url;
  final String? id;

  factory Document.fromJson(Map<String, dynamic> json){
    return Document(
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
