// To parse this JSON data, do
//
//     final updateprofileResModel = updateprofileResModelFromJson(jsonString);

import 'dart:convert';

UpdateprofileResModel updateprofileResModelFromJson(String str) => UpdateprofileResModel.fromJson(json.decode(str));

String updateprofileResModelToJson(UpdateprofileResModel data) => json.encode(data.toJson());

class UpdateprofileResModel {
    String? status;
    String? message;
    Data? data;

    UpdateprofileResModel({
        this.status,
        this.message,
        this.data,
    });

    factory UpdateprofileResModel.fromJson(Map<String, dynamic> json) => UpdateprofileResModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    User? user;

    Data({
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? firstName;
    String? lastName;
    dynamic email;
    String? phone;
    dynamic address;
    dynamic dp;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;

    User({
        this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.address,
        this.dp,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        dp: json["dp"],
        status: json["status"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "address": address,
        "dp": dp,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}
