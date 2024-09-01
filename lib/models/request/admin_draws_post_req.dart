// To parse this JSON data, do
//
//     final adminDrawsPostRequest = adminDrawsPostRequestFromJson(jsonString);

import 'dart:convert';

AdminDrawsPostRequest adminDrawsPostRequestFromJson(String str) => AdminDrawsPostRequest.fromJson(json.decode(str));

String adminDrawsPostRequestToJson(AdminDrawsPostRequest data) => json.encode(data.toJson());

class AdminDrawsPostRequest {
    List<String> winningNumbers;

    AdminDrawsPostRequest({
        required this.winningNumbers,
    });

    factory AdminDrawsPostRequest.fromJson(Map<String, dynamic> json) => AdminDrawsPostRequest(
        winningNumbers: List<String>.from(json["winningNumbers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "winningNumbers": List<dynamic>.from(winningNumbers.map((x) => x)),
    };
}
