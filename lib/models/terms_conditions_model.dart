class ContentsModel {
  ContentsModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ContentsModel.fromJson(Map<String, dynamic> json){
    return ContentsModel(
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

  final List<Contents> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<Contents>.from(json["data"]!.map((x) => Contents.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class Contents {
  Contents({
    required this.id,
    required this.aboutUs,
    required this.termsAndConditions,
    required this.privacyPolicy,
    required this.supports,
    required this.isDeleted,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? aboutUs;
  final String? termsAndConditions;
  final String? privacyPolicy;
  final String? supports;
  final bool? isDeleted;
  final dynamic createdBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory Contents.fromJson(Map<String, dynamic> json){
    return Contents(
      id: json["_id"],
      aboutUs: json["aboutUs"],
      termsAndConditions: json["termsAndConditions"],
      privacyPolicy: json["privacyPolicy"],
      supports: json["supports"],
      isDeleted: json["isDeleted"],
      createdBy: json["createdBy"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
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
