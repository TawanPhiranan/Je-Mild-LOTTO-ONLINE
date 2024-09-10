// To parse this JSON data, do
//
//     final changePasswordRequest = changePasswordRequestFromJson(jsonString);

import 'dart:convert';

ChangePasswordResponse changePasswordResponseFromJson(String str) => ChangePasswordResponse.fromJson(json.decode(str));

String changePasswordResponseToJson(ChangePasswordResponse data) => json.encode(data.toJson());

class ChangePasswordResponse {
    String currentPassword;
    String newPassword;
    String confirmPassword;

    ChangePasswordResponse({
        required this.currentPassword,
        required this.newPassword,
        required this.confirmPassword,
    });

    factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) => ChangePasswordResponse(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
    };
}
