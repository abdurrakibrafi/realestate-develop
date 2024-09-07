// ignore_for_file: unnecessary_new

class AddFavoriteModel {
  bool? success;
  String? message;
  Data? data;

  AddFavoriteModel({this.success, this.message, this.data});

  AddFavoriteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  String? residence;
  String? user;
  String? sId;
  int? iV;

  Data({this.residence, this.user, this.sId, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    residence = json['residence'];
    user = json['user'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['residence'] = residence;
    data['user'] = user;
    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}
