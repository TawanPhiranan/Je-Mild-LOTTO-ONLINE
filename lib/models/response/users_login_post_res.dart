// To parse this JSON data, do
//
//     final usersLoginPostResponse = usersLoginPostResponseFromJson(jsonString);

import 'dart:convert';

UsersLoginPostResponse usersLoginPostResponseFromJson(String str) => UsersLoginPostResponse.fromJson(json.decode(str));

String usersLoginPostResponseToJson(UsersLoginPostResponse data) => json.encode(data.toJson());

class UsersLoginPostResponse {
    String message;
    User user;

    UsersLoginPostResponse({
        required this.message,
        required this.user,
    });

    factory UsersLoginPostResponse.fromJson(Map<String, dynamic> json) => UsersLoginPostResponse(
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user.toJson(),
    };
}

class User {
    int userId;
    String username;
    String phone;
    String email;
    String password;
    dynamic img;
    int typeId;

    User({
        required this.userId,
        required this.username,
        required this.phone,
        required this.email,
        required this.password,
        required this.img,
        required this.typeId,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userID"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        img: json["img"],
        typeId: json["typeID"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "username": username,
        "phone": phone,
        "email": email,
        "password": password,
        "img": img,
        "typeID": typeId,
    };
}
