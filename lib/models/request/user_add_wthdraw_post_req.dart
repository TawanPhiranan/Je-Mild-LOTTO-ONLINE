// To parse this JSON data, do
//
//     final userAddWithdrawPostRequest = userAddWithdrawPostRequestFromJson(jsonString);

import 'dart:convert';

UserAddWithdrawPostRequest userAddWithdrawPostRequestFromJson(String str) => UserAddWithdrawPostRequest.fromJson(json.decode(str));

String userAddWithdrawPostRequestToJson(UserAddWithdrawPostRequest data) => json.encode(data.toJson());

class UserAddWithdrawPostRequest {
    int amount;

    UserAddWithdrawPostRequest({
        required this.amount,
    });

    factory UserAddWithdrawPostRequest.fromJson(Map<String, dynamic> json) => UserAddWithdrawPostRequest(
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
    };
}
