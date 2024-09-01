// To parse this JSON data, do
//
//     final adminDrawGetResponse = adminDrawGetResponseFromJson(jsonString);

import 'dart:convert';

List<AdminDrawGetResponse> adminDrawGetResponseFromJson(String str) => List<AdminDrawGetResponse>.from(json.decode(str).map((x) => AdminDrawGetResponse.fromJson(x)));

String adminDrawGetResponseToJson(List<AdminDrawGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdminDrawGetResponse {
    int drawId;
    String winningNumber;
    int prizeType;
    String drawDate;

    AdminDrawGetResponse({
        required this.drawId,
        required this.winningNumber,
        required this.prizeType,
        required this.drawDate,
    });

    factory AdminDrawGetResponse.fromJson(Map<String, dynamic> json) => AdminDrawGetResponse(
        drawId: json["drawID"],
        winningNumber: json["winningNumber"],
        prizeType: json["prizeType"],
        drawDate: json["drawDate"],
    );

    Map<String, dynamic> toJson() => {
        "drawID": drawId,
        "winningNumber": winningNumber,
        "prizeType": prizeType,
        "drawDate": drawDate,
    };
}
