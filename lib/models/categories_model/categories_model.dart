class CategoriesModel {
  CategoriesModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json){
    return CategoriesModel(
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

  final List<CategoryData> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<CategoryData>.from(json["data"]!.map((x) => CategoryData.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class CategoryData {
  CategoryData({
    required this.id,
    required this.name,
    required this.isDeleted,
  });

  final String? id;
  final String? name;
  final bool? isDeleted;

  factory CategoryData.fromJson(Map<String, dynamic> json){
    return CategoryData(
      id: json["_id"],
      name: json["name"],
      isDeleted: json["isDeleted"],
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
