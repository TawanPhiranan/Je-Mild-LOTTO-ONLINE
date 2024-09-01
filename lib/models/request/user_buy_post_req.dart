// To parse this JSON data, do
//
//     final userBuyPostRequest = userBuyPostRequestFromJson(jsonString);

import 'dart:convert';

UserBuyPostRequest userBuyPostRequestFromJson(String str) => UserBuyPostRequest.fromJson(json.decode(str));

String userBuyPostRequestToJson(UserBuyPostRequest data) => json.encode(data.toJson());

class UserBuyPostRequest {
    String lottoNumber;

    UserBuyPostRequest({
        required this.lottoNumber,
    });

    factory UserBuyPostRequest.fromJson(Map<String, dynamic> json) => UserBuyPostRequest(
        lottoNumber: json["lottoNumber"],
    );

    Map<String, dynamic> toJson() => {
        "lottoNumber": lottoNumber,
    };
}
