

import 'dart:convert';

EditUserIdGetResponse editUserIdGetResponseFromJson(String str) => EditUserIdGetResponse.fromJson(json.decode(str));

String editUserIdGetResponseToJson(EditUserIdGetResponse data) => json.encode(data.toJson());

class EditUserIdGetResponse {
    int userId;
    String username;
    String phone;
    String email;

    EditUserIdGetResponse({
        required this.userId,
        required this.username,
        required this.phone,
        required this.email,
    });

    factory EditUserIdGetResponse.fromJson(Map<String, dynamic> json) => EditUserIdGetResponse(
        userId: json["userID"],
        username: json["username"],
        phone: json["phone"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "username": username,
        "phone": phone,
        "email": email,
    };
}
