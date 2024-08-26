// To parse this JSON data, do
//
//     final editUserIdGetResponse = editUserIdGetResponseFromJson(jsonString);

import 'dart:convert';

EditUserIdGetResponse editUserIdGetResponseFromJson(String str) => EditUserIdGetResponse.fromJson(json.decode(str));

String editUserIdGetResponseToJson(EditUserIdGetResponse data) => json.encode(data.toJson());

class EditUserIdGetResponse {
    int userId;
    String username;
    String phone;
    String email;
    dynamic img;
    int typeId;

    EditUserIdGetResponse({
        required this.userId,
        required this.username,
        required this.phone,
        required this.email,
        required this.img,
        required this.typeId,
    });

    factory EditUserIdGetResponse.fromJson(Map<String, dynamic> json) => EditUserIdGetResponse(
        userId: json["userID"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
        img: json["img"],
        typeId: json["typeID"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "username": username,
        "phone": phone,
        "email": email,
        "img": img,
        "typeID": typeId,
    };
}
