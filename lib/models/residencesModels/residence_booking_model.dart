class ResidenceBookingModel {
  bool success;
  String message;
  BookingData data;

  ResidenceBookingModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResidenceBookingModel.fromJson(Map<String, dynamic> json) {
    return ResidenceBookingModel(
      success: json['success'],
      message: json['message'],
      data: BookingData.fromJson(json['data']),
    );
  }
}

class BookingData {
  String user;
  String residence;
  DateTime startDate;
  DateTime endDate;
  int totalPrice;
  String author;
  ExtraInfo extraInfo;
  bool isPaid;
  bool isDeleted;
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  BookingData({
    required this.user,
    required this.residence,
    required this.startDate,
    required this.endDate,
    required this.totalPrice,
    required this.author,
    required this.extraInfo,
    required this.isPaid,
    required this.isDeleted,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      user: json['user'],
      residence: json['residence'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      totalPrice: json['totalPrice'],
      author: json['author'],
      extraInfo: ExtraInfo.fromJson(json['extraInfo']),
      isPaid: json['isPaid'],
      isDeleted: json['isDeleted'],
      id: json['_id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}

class ExtraInfo {
  String name;
  String email;
  String age;
  String gender;
  String phoneNumber;
  String address;
  String id;

  ExtraInfo({
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.phoneNumber,
    required this.address,
    required this.id,
  });

  factory ExtraInfo.fromJson(Map<String, dynamic> json) {
    return ExtraInfo(
      name: json['name'],
      email: json['email'],
      age: json['age'],
      gender: json['gender'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      id: json['_id'],
    );
  }
}
