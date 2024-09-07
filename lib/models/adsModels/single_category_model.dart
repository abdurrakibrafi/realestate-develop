class CategoryModelSingle {
  CategoryModelSingle({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory CategoryModelSingle.fromJson(Map<String, dynamic> json) {
    return CategoryModelSingle(
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

  final List<SingleCat> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      data: json["data"] == null
          ? []
          : List<SingleCat>.from(
              json["data"]!.map((x) => SingleCat.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }
}

class SingleCat {
  SingleCat({
    required this.id,
    required this.banner,
    required this.contactLink,
    required this.category,
    required this.isDeleted,
  });

  final String? id;
  final String? banner;
  final String? contactLink;
  final Category? category;
  final bool? isDeleted;

  factory SingleCat.fromJson(Map<String, dynamic> json) {
    return SingleCat(
      id: json["_id"],
      banner: json["banner"],
      contactLink: json["contactLink"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      isDeleted: json["isDeleted"],
    );
  }
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  final String? id;
  final String? name;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["_id"],
      name: json["name"],
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

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: json["page"],
      limit: json["limit"],
      total: json["total"],
      totalPage: json["totalPage"],
    );
  }
}
