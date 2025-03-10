// To parse this JSON data, do
//
//     final generateOtpModel = generateOtpModelFromJson(jsonString);

import 'dart:convert';

GenerateOtpModel generateOtpModelFromJson(String str) => GenerateOtpModel.fromJson(json.decode(str));

String generateOtpModelToJson(GenerateOtpModel data) => json.encode(data.toJson());

class GenerateOtpModel {
    String status;
    String message;
    Data data;

    GenerateOtpModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory GenerateOtpModel.fromJson(Map<String, dynamic> json) => GenerateOtpModel(
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
    String otp;

    Data({
        required this.otp,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
    };
}
