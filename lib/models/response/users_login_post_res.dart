// To parse this JSON data, do
//
//     final usersLoginPostResponse = usersLoginPostResponseFromJson(jsonString);

import 'dart:convert';

UsersLoginPostResponse usersLoginPostResponseFromJson(String str) => UsersLoginPostResponse.fromJson(json.decode(str));

String usersLoginPostResponseToJson(UsersLoginPostResponse data) => json.encode(data.toJson());

class UsersLoginPostResponse {
    String message;
    Users users;

    UsersLoginPostResponse({
        required this.message,
        required this.users,
    });

    factory UsersLoginPostResponse.fromJson(Map<String, dynamic> json) => UsersLoginPostResponse(
        message: json["message"],
        users: Users.fromJson(json["Users"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "Users": users.toJson(),
    };
}

class Users {
    int userId;
    String username;
    String phone;
    String email;
    String password;
    dynamic img;
    int typeId;

    Users({
        required this.userId,
        required this.username,
        required this.phone,
        required this.email,
        required this.password,
        required this.img,
        required this.typeId,
    });

    factory Users.fromJson(Map<String, dynamic> json) => Users(
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
