// To parse this JSON data, do
//
//     final refreshTokebnModel = refreshTokebnModelFromJson(jsonString);

import 'dart:convert';

RefreshTokebnModel refreshTokebnModelFromJson(String str) => RefreshTokebnModel.fromJson(json.decode(str));

String refreshTokebnModelToJson(RefreshTokebnModel data) => json.encode(data.toJson());

class RefreshTokebnModel {
    String status;
    String message;
    Data data;

    RefreshTokebnModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory RefreshTokebnModel.fromJson(Map<String, dynamic> json) => RefreshTokebnModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String token;

    Data({
        required this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
