// To parse this JSON data, do
//
//     final userResgisterPostRequest = userResgisterPostRequestFromJson(jsonString);

import 'dart:convert';

UserResgisterPostRequest userResgisterPostRequestFromJson(String str) => UserResgisterPostRequest.fromJson(json.decode(str));

String userResgisterPostRequestToJson(UserResgisterPostRequest data) => json.encode(data.toJson());

class UserResgisterPostRequest {
    String username;
    String phone;
    String email;
    String password;
    String confirmPassword;

    UserResgisterPostRequest({
        required this.username,
        required this.phone,
        required this.email,
        required this.password,
        required this.confirmPassword,
    });

    factory UserResgisterPostRequest.fromJson(Map<String, dynamic> json) => UserResgisterPostRequest(
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "phone": phone,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
    };
}
