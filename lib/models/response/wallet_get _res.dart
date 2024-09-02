// To parse this JSON data, do
//
//     final walletGetResponse = walletGetResponseFromJson(jsonString);

import 'dart:convert';

List<WalletGetResponse> walletGetResponseFromJson(String str) => List<WalletGetResponse>.from(json.decode(str).map((x) => WalletGetResponse.fromJson(x)));

String walletGetResponseToJson(List<WalletGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WalletGetResponse {
    int transactionId;
    int userId;
    int amount;
    String transactionDate;

    WalletGetResponse({
        required this.transactionId,
        required this.userId,
        required this.amount,
        required this.transactionDate,
    });

    factory WalletGetResponse.fromJson(Map<String, dynamic> json) => WalletGetResponse(
        transactionId: json["transactionID"],
        userId: json["userID"],
        amount: json["amount"],
        transactionDate: json["transactionDate"],
    );

    Map<String, dynamic> toJson() => {
        "transactionID": transactionId,
        "userID": userId,
        "amount": amount,
        "transactionDate": transactionDate,
    };
}
