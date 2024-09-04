// To parse this JSON data, do
//
//     final showMoneyGetResponse = showMoneyGetResponseFromJson(jsonString);

import 'dart:convert';

List<ShowMoneyGetResponse> showMoneyGetResponseFromJson(String str) => List<ShowMoneyGetResponse>.from(json.decode(str).map((x) => ShowMoneyGetResponse.fromJson(x)));

String showMoneyGetResponseToJson(List<ShowMoneyGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowMoneyGetResponse {
    String username;
    int total;

    ShowMoneyGetResponse({
        required this.username,
        required this.total,
    });

    factory ShowMoneyGetResponse.fromJson(Map<String, dynamic> json) => ShowMoneyGetResponse(
        username: json["username"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "total": total,
    };
}
