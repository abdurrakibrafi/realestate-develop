class AllFriendModel {
  AllFriendModel({
    this.success,
    this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Friends> data;

  factory AllFriendModel.fromJson(Map<String, dynamic> json) {
    return AllFriendModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Friends>.from(json["data"]!.map((x) => Friends.fromJson(x))),
    );
  }
}

class Friends {
  Friends({
    required this.chat,
    required this.message,
    required this.unreadMessageCount,
  });

  final Chat? chat;
  final Message? message;
  final int? unreadMessageCount;

  factory Friends.fromJson(Map<String, dynamic> json) {
    return Friends(
      chat: json["chat"] == null ? null : Chat.fromJson(json["chat"]),
      message:
          json["message"] == null ? null : Message.fromJson(json["message"]),
      unreadMessageCount: json["unreadMessageCount"],
    );
  }
}

class Chat {
  Chat({
    required this.id,
    required this.participants,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final List<Participant> participants;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json["_id"],
      participants: json["participants"] == null
          ? []
          : List<Participant>.from(
              json["participants"]!.map((x) => Participant.fromJson(x))),
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}

class Participant {
  Participant({
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

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
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

class Message {
  Message({
    required this.id,
    required this.messageId,
    required this.text,
    required this.imageUrl,
    required this.seen,
    required this.sender,
    required this.receiver,
    required this.chat,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? messageId;
  final String? text;
  final String? imageUrl;
  final bool? seen;
  final String? sender;
  final String? receiver;
  final String? chat;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json["_id"],
      messageId: json["id"],
      text: json["text"],
      imageUrl: json["imageUrl"],
      seen: json["seen"],
      sender: json["sender"],
      receiver: json["receiver"],
      chat: json["chat"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }
}
