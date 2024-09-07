class AddRatingModel {
  bool? success;
  String? message;
  Data? data;

  AddRatingModel({this.success, this.message, this.data});

  AddRatingModel.fromJson(Map<String, dynamic> json) {
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
  String? user;
  String? residence;
  int? rating;
  List<Images>? images;
  String? comment;
  bool? isDeleted;
  String? sId;
  int? iV;

  Data(
      {this.user,
      this.residence,
      this.rating,
      this.images,
      this.comment,
      this.isDeleted,
      this.sId,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    residence = json['residence'];
    rating = json['rating'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    comment = json['comment'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user;
    data['residence'] = residence;
    data['rating'] = rating;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['comment'] = comment;
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
    data['__v'] = iV;
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
