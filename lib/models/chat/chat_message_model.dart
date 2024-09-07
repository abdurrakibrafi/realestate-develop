class ChatMessagesModel {
  ChatMessagesModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ChatMessagesModel.fromJson(Map<String, dynamic> json){
    return ChatMessagesModel(
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

  final List<ChatMessage> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<ChatMessage>.from(json["data"]!.map((x) => ChatMessage.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class ChatMessage {
  ChatMessage({
    required this.bookingId,
    required this.showButton,
    required this.id,
    required this.datumId,
    required this.text,
    required this.imageUrl,
    required this.seen,
    required this.sender,
    required this.receiver,
    required this.isPaymentLink,
    required this.chat,
    required this.createdAt,
    required this.updatedAt,
  });

  final dynamic bookingId;
  final bool? showButton;
  final String? id;
  final String? datumId;
  final String? text;
  final String? imageUrl;
  final bool? seen;
  final Receiver? sender;
  final Receiver? receiver;
  final String? isPaymentLink;
  final String? chat;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ChatMessage.fromJson(Map<String, dynamic> json){
    return ChatMessage(
      bookingId: json["bookingId"],
      showButton: json["showButton"],
      id: json["_id"],
      datumId: json["id"],
      text: json["text"],
      imageUrl: json["imageUrl"],
      seen: json["seen"],
      sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
      receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
      isPaymentLink: json["isPaymentLink"],
      chat: json["chat"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Receiver {
  Receiver({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.image,
    required this.phoneNumber,
    required this.role,
  });

  final String? id;
  final String? username;
  final String? name;
  final String? email;
  final String? image;
  final String? phoneNumber;
  final String? role;

  factory Receiver.fromJson(Map<String, dynamic> json){
    return Receiver(
      id: json["_id"],
      username: json["username"],
      name: json["name"],
      email: json["email"],
      image: json["image"],
      phoneNumber: json["phoneNumber"],
      role: json["role"],
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
