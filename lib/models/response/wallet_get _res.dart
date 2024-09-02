// To parse this JSON data, do
//
//     final transactionGetResponse = transactionGetResponseFromJson(jsonString);

import 'dart:convert';

List<TransactionGetResponse> transactionGetResponseFromJson(String str) => List<TransactionGetResponse>.from(json.decode(str).map((x) => TransactionGetResponse.fromJson(x)));

String transactionGetResponseToJson(List<TransactionGetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionGetResponse {
    int transactionId;
    int userId;
    int amount;
    String transactionDate;

    TransactionGetResponse({
        required this.transactionId,
        required this.userId,
        required this.amount,
        required this.transactionDate,
    });

    factory TransactionGetResponse.fromJson(Map<String, dynamic> json) => TransactionGetResponse(
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
